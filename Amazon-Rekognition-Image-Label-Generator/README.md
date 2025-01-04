
# 🖼️ Image Labels Generator Using Amazon Rekognition

## 📄 Project Overview
This project utilizes python to create a GUI based application which connects to AWS services like S3 and Amazon Rekognition to provide labels to images provided

## 🛠️ Technologies Used
- **Amazon Rekognition** – For analyzing images and generating labels.
- **Amazon S3** – For storing images.
- **AWS CLI** – For managing AWS services through the command line.
- **Python** – For scripting and integrating AWS SDK.
## 🚀 Getting Started
### Prerequisites
1. Install Python 3.x: [Python Download](https://www.python.org/downloads/)
2. Install AWS CLI: [AWS CLI Installation](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
3. Create an AWS account and configure your credentials.

### Install Dependencies
```bash
pip install -r requirements.txt
```

### Set Up AWS CLI
```bash
aws configure
```
## 🗂️ Project Structure

```plaintext
image-labels-generator/
│
├── image_labels_generator.py   # Main Python script to interact with AWS services
└── requirements.txt           # Python dependencies
```

## ⚙️ Architecture Diagram
![Amazon-Rekognition-Image-Label-Generator/Images/amazonRekognitionDiagram.png ](https://github.com/Tywest-Coat/AWS-Projects/blob/main/Amazon-Rekognition-Image-Label-Generator/Images/amazonRekognitionDiagram.png)

## 🔧 Troubleshooting

Common issues and solutions:

1. AWS Credentials not found

    - Solution: Verify AWS CLI configuration

2. S3 bucket access denied

    - Solution: Check IAM permissions

3. Rekognition service access denied

    - Solution: Verify IAM policies

## 💡 Application Overview

- GUI Application Before Input ![Amazon-Rekognition-Image-Label-Generator/Images/appInitialStateOrigin.png ](https://github.com/Tywest-Coat/AWS-Projects/blob/main/Amazon-Rekognition-Image-Label-Generator/Images/appInitialStateOrigin.png)

- GUI Application After Input ![Amazon-Rekognition-Image-Label-Generator/Images/appStatePost.png ](https://github.com/Tywest-Coat/AWS-Projects/blob/main/Amazon-Rekognition-Image-Label-Generator/Images/appStatePost.png)


---

**Created by Tyler Westcoat**  
www.linkedin.com/in/tyler-westcoat-871502204
