# Linux-Based Web Application on AWS (Terraform)

## **Project Overview**
This project demonstrates the deployment of a Linux-based web application using Terraform to provision and manage AWS resources. The infrastructure includes an EC2 instance running Amazon Linux 2, secured by a Security Group, and follows the AWS Well-Architected Framework to ensure best practices.

---

## **Features**
- Automated provisioning of AWS infrastructure using Terraform.
- Security-focused design with a custom Security Group allowing HTTP and SSH access.
- Use of Terraform variables for flexibility and scalability.
- Clear and structured directory layout for modularity and reusability.

---

## **Infrastructure Components**
1. **AWS EC2 Instance**:
   - Runs Amazon Linux 2.
   - Configured with SSH access and HTTP for web traffic.
2. **AWS Security Group**:
   - Ingress rules for HTTP (port 80) and SSH (port 22).
   - Egress rules for all outbound traffic.
3. **Terraform Files**:
   - `provider.tf`: Configures the AWS provider.
   - `variables.tf`: Defines input variables.
   - `main.tf`: Core resources (EC2 instance and Security Group).
   - `outputs.tf`: Outputs for easy access to resource information.

---

## **Skills Learned**
1. **Terraform Best Practices**:
   - Modular configuration with separate `.tf` files for provider, variables, resources, and outputs.
   - Use of input variables and outputs for flexibility and automation.
2. **AWS Services**:
   - EC2 for hosting the application.
   - Security Groups for controlled access.
3. **Cloud Automation**:
   - Infrastructure as Code (IaC) with Terraform.
   - Version-controlled infrastructure setup.
4. **AWS Well-Architected Framework Alignment**:
   - Operational Excellence: Automated provisioning and monitoring.
   - Security: Restricted access and IAM best practices.
   - Reliability: Configurable instance types and scalable design.
   - Performance Efficiency: Optimized resource allocation.
   - Cost Optimization: Utilization of Free Tier resources (e.g., `t2.micro`).

---

## **AWS Well-Architected Framework Alignment**
1. **Operational Excellence**:
   - Infrastructure is fully automated using Terraform.
   - Easy to modify and replicate using reusable `.tf` files.

2. **Security**:
   - Use of Security Groups to restrict inbound and outbound traffic.
   - Avoidance of hardcoding sensitive data using variables and `terraform.tfvars`.

3. **Reliability**:
   - Designed with fault tolerance in mind by leveraging AWS-managed resources.

4. **Performance Efficiency**:
   - Selection of lightweight and efficient `t2.micro` instance.

5. **Cost Optimization**:
   - Resources fall within the Free Tier for development and testing.

---

## **Directory Structure**
```plaintext
linux-web-app/
├── main.tf # Core infrastructure resources
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

---

## **Usage Instructions**
1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd linux-web-app
   ```

2. Initialize Terraform:
   ```bash
   terraform init
   ```

3. Validate the configuration:
   ```bash
   terraform validate
   ```

4. Plan the infrastructure:
   ```bash
   terraform plan -out=tfplan
   ```

5. Apply the configuration:
   ```bash
   terraform apply tfplan
   ```

6. Access the deployed instance using the public IP:
   ```bash
   terraform output ec2_public_ip
   ```

---

## **Future Enhancements**
- Automate software deployment using User Data or AWS Systems Manager.
- Extend the infrastructure with a Load Balancer and Auto Scaling Group.
- Implement monitoring with CloudWatch and alarms for operational insights.
- Secure resources using AWS IAM roles and policies.

---

## **License**
This project is licensed under the MIT License. See the `LICENSE` file for details.
