# 🌟 Linux-Based Web Application on AWS (Terraform)

## 📜 Overview
This project demonstrates the deployment of a highly available and scalable Linux-based web application using Terraform to provision and manage AWS resources. The infrastructure includes an application load balancer connected to an autoscaling group which scales out web servers when needed based on CloudWatch alarms. 

## 🔧 Technologies Used
- **AWS Services**: 
  - Application Load Balancer (Load Balancing)
  - EC2 Autoscaling group (Auto Scaling EC2 Instances)
  - S3 (Static Website Hosting)
  - IAM (Access Management)
  - Security Groups (Network Security)
- **Infrastructure as Code**: 
  - Terraform v1.0.0+
- **Other Tools**:
  - Git (Version Control)
  - AWS CLI (AWS Management)
 
## ⚙️ Architecture Diagram
If applicable, include an architecture diagram of the solution. You can use tools like Lucidchart or draw it directly in Markdown using an image.

## **Directory Structure**
```plaintext
linux-web-app/
├── alb.tf # Application Load Balancer resources
├── asg.tf # Autoscaling Group resources
├── security.tf # Security groups configuration
├── vpc.tf # VPC configuration
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

## **Core Components**
1. **Application Load Balancer (ALB)**

  File: alb.tf
   - Acts as the entry point for web traffic
   - Distributes incoming HTTP traffic across multiple EC2 instances
   - Components:
     - aws_lb "web_app"               # The load balancer itself
     - aws_lb_target_group "web_app"  # Group of targets (EC2 instances)
     - aws_lb_listener "web_app"      # Listens on port 80 (HTTP)
   - Health checks configured to verify instance health every 30 seconds
   - Routes traffic to instances that respond with HTTP 200 on path "/"
2. **Auto Scaling Group (ASG)**

  File: asg.tf
  - Manages EC2 instances automatically
  - Ensures high availability across multiple AZs
  - Uses a launch template to create standardized instances
  - Scales based on defined metrics and policies
  - Integrates with ALB target group for traffic distribution
3. **Networking**

  File: vpc.tf
    - Uses the default vpc, but can be configured to use a custom VPC in production environments
    - Utilizes public subnets across multiple AZs
    - Components:
        -local.vpc_id             # Referenced VPC
        -local.public_subnet_ids  # Public subnets for ALB and EC2 instances
        
4. **Security Groups**

  File: security.tf
  - Controls inbound/outbound traffic
  - ALB security group allows HTTP (port 80) from internet
  - EC2 instances security group allows traffic from ALB

5. Web Application

  - Static website content
  - Features:
     - Dark mode toggle
     - Visitor counter integration
     - Responsive design
  - Connects to API gateway for visitor counting functionality



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



---

**Created by Tyler Westcoat**  
www.linkedin.com/in/tyler-westcoat-871502204
