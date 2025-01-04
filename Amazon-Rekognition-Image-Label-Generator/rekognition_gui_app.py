# Import required libraries
import boto3  # AWS SDK for Python
import tkinter as tk  # GUI library
from tkinter import filedialog, messagebox  # Dialog boxes for file selection and messages
from PIL import Image  # Image processing library
from io import BytesIO  # For handling binary I/O
from matplotlib.figure import Figure  # For creating plots
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg  # For embedding matplotlib in tkinter
import matplotlib.patches as patches  # For drawing bounding boxes


class RekognitionApp:
    """Main application class for AWS Rekognition GUI"""
    
    def __init__(self, root):
        """Initialize the application window and components"""
        self.root = root
        self.root.title("AWS Rekognition GUI")
        # S3 bucket where images will be stored
        self.bucket_name = "aws-rekognition-label-images-9315"  # Replace with your bucket name

        # Configure window to resize dynamically
        self.root.rowconfigure(0, weight=1)
        self.root.columnconfigure(1, weight=1)

        # Create main frames for input and output sections
        self.left_frame = tk.Frame(root, width=300, bg="lightblue")
        self.left_frame.grid(row=0, column=0, sticky="nsew")
        self.right_frame = tk.Frame(root, bg="white")
        self.right_frame.grid(row=0, column=1, sticky="nsew")

        # Configure frames for dynamic resizing
        self.left_frame.rowconfigure(0, weight=1)
        self.left_frame.columnconfigure(0, weight=1)
        self.right_frame.rowconfigure(0, weight=1)
        self.right_frame.rowconfigure(1, weight=1)
        self.right_frame.columnconfigure(0, weight=1)

        # Create and configure input section widgets
        tk.Label(self.left_frame, text="Input Section", bg="lightblue", font=("Arial", 16)).grid(pady=10)
        self.upload_btn = tk.Button(
            self.left_frame, text="Select Image", command=self.select_image, font=("Arial", 12)
        )
        self.upload_btn.grid(pady=20)
        self.clear_btn = tk.Button(
            self.left_frame, text="Clear Output", command=self.clear_output, font=("Arial", 12)
        )
        self.clear_btn.grid(pady=20)
        self.file_label = tk.Label(self.left_frame, text="No file selected", bg="lightblue", wraplength=200)
        self.file_label.grid(pady=10)

        # Create and configure output section widgets
        tk.Label(self.right_frame, text="Output Section", bg="white", font=("Arial", 16)).grid(row=0, column=0, pady=10)

        # Setup matplotlib canvas for displaying images
        self.figure = Figure(figsize=(10, 6), dpi=100)
        self.ax = self.figure.add_subplot(111)
        self.canvas = FigureCanvasTkAgg(self.figure, self.right_frame)
        self.plot_widget = self.canvas.get_tk_widget()
        self.plot_widget.grid(row=0, column=0, sticky="nsew")

        # Create label for displaying detection results
        self.labels_display = tk.Label(
            self.right_frame, text="", bg="white", font=("Arial", 12), justify="left", wraplength=500
        )
        self.labels_display.grid(row=1, column=0, sticky="nsew", pady=10)

    def select_image(self):
        """Handle image selection and initiate analysis process"""
        # Clear any existing output
        self.clear_output()

        # Open file dialog for image selection
        file_path = filedialog.askopenfilename(
            filetypes=[("JPEG files", "*.jpg"), ("All files", "*.*")]
        )
        if file_path:
            self.file_label.config(text=f"Selected: {file_path}")
            try:
                self.upload_to_s3(file_path)
                self.analyze_image(file_path)
            except Exception as e:
                messagebox.showerror("Error", f"An error occurred: {e}")

    def upload_to_s3(self, file_path):
        """Upload selected image to AWS S3 bucket"""
        s3_client = boto3.client("s3")
        file_name = file_path.split("/")[-1]
        with open(file_path, "rb") as file_data:
            s3_client.upload_fileobj(file_data, self.bucket_name, file_name)
        messagebox.showinfo("Success", f"File uploaded to S3: {file_name}")

    def analyze_image(self, file_path):
        """Send image to AWS Rekognition for label detection"""
        client = boto3.client("rekognition")
        file_name = file_path.split("/")[-1]

        # Request label detection from Rekognition
        response = client.detect_labels(
            Image={"S3Object": {"Bucket": self.bucket_name, "Name": file_name}},
            MaxLabels=10,
        )

        # Display the analysis results
        self.display_results(response, file_path)

    def display_results(self, response, file_path):
        """Process and display the Rekognition analysis results"""
        # Retrieve image from S3
        s3 = boto3.resource("s3")
        obj = s3.Object(self.bucket_name, file_path.split("/")[-1])
        img_data = obj.get()["Body"].read()

        # Load and display the image
        img = Image.open(BytesIO(img_data))
        img_width, img_height = img.size

        # Prepare the plot
        self.ax.clear()
        self.ax.imshow(img)

        # Process each detected label and draw bounding boxes
        for label in response["Labels"]:
            for instance in label.get("Instances", []):
                # Calculate bounding box coordinates
                bbox = instance["BoundingBox"]
                left = bbox["Left"] * img_width
                top = bbox["Top"] * img_height
                width = bbox["Width"] * img_width
                height = bbox["Height"] * img_height

                # Draw the bounding box
                self.ax.add_patch(
                    patches.Rectangle(
                        (left, top),
                        width,
                        height,
                        linewidth=2,
                        edgecolor="red",
                        facecolor="none",
                    )
                )
                # Add label text above the bounding box
                label_text = f"{label['Name']} ({label['Confidence']:.2f}%)"
                self.ax.text(
                    left,
                    top - 5,
                    label_text,
                    color="red",
                    fontsize=8,
                    bbox=dict(facecolor="white", alpha=0.7),
                )

        # Update the display
        self.canvas.draw()

        # Create and display list of top 10 labels
        labels = [
            f"{i + 1}. {label['Name']} ({label['Confidence']:.2f}%)"
            for i, label in enumerate(response["Labels"][:10])
        ]
        self.labels_display.config(
            text="Top 10 Labels:\n" + "\n".join(labels), wraplength=self.root.winfo_width() - 50
        )

    def clear_output(self):
        """Reset the display to its initial state"""
        # Clear the image display
        self.ax.clear()
        self.canvas.draw()

        # Clear the labels list
        self.labels_display.config(text="")
        self.file_label.config(text="No file selected")


# Application entry point
if __name__ == "__main__":
    root = tk.Tk()
    root.geometry("1200x800")  # Set initial window size
    app = RekognitionApp(root)
    root.mainloop()
