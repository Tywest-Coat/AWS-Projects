# 🌟 Linux-Based Web Application on AWS (Terraform)

## 📜 Overview
This project demonstrates the deployment of a Linux-based web application using Terraform to provision and manage AWS resources. The infrastructure includes an EC2 instance running Amazon Linux 2 and an S3 bucket for static website hosting, secured by appropriate IAM roles and security groups, following AWS Well-Architected Framework best practices.

## 🔧 Technologies Used
- **AWS Services**: 
  - EC2 (Compute)
  - S3 (Static Website Hosting)
  - IAM (Access Management)
  - Security Groups (Network Security)
- **Infrastructure as Code**: 
  - Terraform v1.0.0+
- **Other Tools**:
  - Git (Version Control)
  - AWS CLI (AWS Management)

## **Directory Structure**
```plaintext
linux-web-app/
├── providers.tf # AWS provider configuration
├── versions.tf # Terraform and provider versions
├── variables.tf # Variable declarations
├── outputs.tf # Output declarations
├── networking.tf # Security group resources
├── s3.tf # S3 bucket and website hosting
├── iam.tf # IAM roles and policies
├── compute.tf # EC2 and key pair resources
└── terraform.tfvars # Variable values (git-ignored)
```

## ⚙️ Architecture Diagram
If applicable, include an architecture diagram of the solution. You can use tools like Lucidchart or draw it directly in Markdown using an image.

## 🚀 Getting Started
1. **Prerequisites**: 
   - AWS account
   - Terraform installation
   - CLI configuration
   - Git

2. **Installation**:
   - Clone the repository
   - Configure terraform.tfvars
   - Initialize Terraform & deploy resources

## 📝 Usage
1. Get the EC2 instance public IP
2. Access the website


## 🔐 Security Considerations
1. S3 Bucket Security
   - Public read-only access for website content
2. EC2 Security
   - Restricted SSH access
   - Security group limiting inbound traffic
   - IAM role with least privilege
3. Network Security
   - Inbound traffic restricted to HTTP/HTTPS
   - Security group rules for specific ports
   - SSH access limited to authorized IPs

## 💡 Features
- Automated infrastructure deployment
- Static website hosting
- Secure EC2 instance configuration
- IAM role-based access control
- Public/Private key pair generation
- S3 bucket website configuration
- Security group management

## 🔄 Future Enhancements
- Add CloudFront distribution for content delivery (HTTPS improvement)
- Implement auto-scaling group (high availability/scaling)
- Add RDS database integration
- Implement CloudWatch monitoring
- Add SSL/TLS Certificate

### Issues I Ran Into

1.  **EC2 Connection Issues**
    -   Verify security group rules
    -   Check key pair
    -   Confirm network access

2.  **S3 Access Issues**
    -   Verify IAM roles
    -   Check bucket policy
    -   Confirm permissions

## 📄 License
Include the license for your project (e.g., MIT, Apache-2.0). If none, just indicate "All Rights Reserved."

## 💬 Contact
Provide contact information or ways for others to reach out for questions or collaboration.

---

**Created by [Your Name]**  
[Your LinkedIn or Portfolio URL]
