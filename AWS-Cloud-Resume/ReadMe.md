# 🌐 Cloud Resume Project  

This project showcases a cloud-based implementation of my resume, which is deployed as a static website with additional features and integrations using various AWS services. It was designed to demonstrate my cloud engineering and development skills.  

---

## 🛠️ Project Overview  

This project includes:  
- 📝 A professional HTML/CSS version of my resume.  
- 🌍 A static website hosted on **Amazon S3**, served securely using **Amazon CloudFront** with HTTPS.  
- 🌐 A custom domain name (**resume.tylerwestcoat.com**) managed via **Amazon Route 53**.  
- 🎛️ Interactive features such as:  
  - **Visitor Counter Widget** to track page views using **Amazon DynamoDB**.  
  - **Dark Mode Toggle Widget** for an improved user experience.  
- 💻 Backend logic written in **Python** using **AWS Lambda**, integrated with **AWS API Gateway** for secure database interactions.  
- 🚀 Source control and CI/CD pipelines implemented with **GitHub Actions** for both frontend and backend development.  

---

## ✨ Features  

### 1. **Static Website**  
- Built a visually appealing resume using **HTML** and **CSS**.  
- Deployed the static website on **Amazon S3** as a public bucket.  

### 2. **Secure and Fast Content Delivery**  
- Configured **Amazon CloudFront** as a content delivery network (CDN) to serve the website over HTTPS for enhanced security and speed.  

### 3. **Custom Domain Name**  
- Linked the website to the custom domain name **resume.tylerwestcoat.com**.  
- Used **Amazon Route 53** to manage DNS records for seamless redirection.  

### 4. **Interactive Widgets**  
- 📊 Added a **Visitor Counter Widget** using **JavaScript**.  
- 🌙 Integrated a **Dark Mode Toggle Widget** for accessibility and enhanced user experience.  

### 5. **Visitor Counter Implementation**  
- Used **Amazon DynamoDB** to store visitor count data.  
- Built a **Python** Lambda function to handle database read/write operations.  
- Exposed the functionality via an **AWS API Gateway** endpoint that the visitor counter widget communicates with.  

### 6. **CI/CD Pipelines**  
- Utilized **GitHub Repositories** for source control of both frontend and backend code.  
- Configured **GitHub Actions** to implement CI/CD pipelines for:  
  - Frontend deployment to **Amazon S3**.  
  - Backend deployment to **AWS Lambda**.  

---

## 📋 Architecture Diagram  

![AWS-Cloud-Resume/awscloudresumechallenge.png ](https://github.com/Tywest-Coat/AWS-Projects/blob/main/AWS-Cloud-Resume/awscloudresumechallengewhitebg.png)

---

## 🔧 Technologies Used  

- **Frontend**: HTML, CSS, JavaScript  
- **Backend**: Python, AWS Lambda  
- **Database**: Amazon DynamoDB  
- **Hosting**: Amazon S3, Amazon CloudFront, Amazon Route 53  
- **API Management**: AWS API Gateway  
- **Source Control & CI/CD**: GitHub Repositories, GitHub Actions  

---

## 🛠️ Project Setup  

### Prerequisites  
- An AWS Account  
- Custom domain name (e.g., purchased via Route 53 or another registrar)  
- GitHub account  

### Steps to Deploy  

1. **Frontend Setup**:  
   - Build the HTML/CSS resume and add interactive widgets using JavaScript.  
   - Deploy the static website to an **Amazon S3** bucket.  

2. **CloudFront Configuration**:  
   - Configure **Amazon CloudFront** for secure content delivery over HTTPS.  

3. **Custom Domain Configuration**:  
   - Set up the custom domain name in **Amazon Route 53**.  
   - Update DNS records to point to the CloudFront distribution.  

4. **Backend Setup**:  
   - Create a **DynamoDB** table to track visitor counts.  
   - Write a **Python Lambda function** to interact with the database.  
   - Expose the Lambda function via **API Gateway**.  

5. **CI/CD Pipelines**:  
   - Push frontend and backend code to **GitHub Repositories**.  
   - Configure **GitHub Actions** workflows for automated deployments.  

---

## 🎉 Usage  

1. **Visit the Website**:  
   Access the resume at: **[resume.tylerwestcoat.com](https://resume.tylerwestcoat.com)**  

2. **Explore Features**:  
   - View the visitor counter widget in action.  
   - Toggle between light and dark modes for better accessibility.  

---

## 🧠 Lessons Learned  

- Hands-on experience with AWS services like S3, CloudFront, Route 53, API Gateway, Lambda, and DynamoDB.  
- Implementing CI/CD pipelines with GitHub Actions for frontend and backend.  
- Developing full-stack, serverless applications with interactive elements.  

---

## 🚧 Issues I Ran Into  

-  ❌ Invalidation of CloudFront cache after GitHub Repo modification.
  

---

Feel free to fork this repository, contribute, or share your thoughts by opening an issue! 💬  
