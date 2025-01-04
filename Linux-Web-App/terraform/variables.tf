# EC2 Instance Type
# Defines the compute and memory capacity of the EC2 instance
# t2.micro is free tier eligible and good for development/testing
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

# Key Pair Name
# Required for SSH access to the EC2 instance
# Must be created separately in AWS console or via AWS CLI
variable "key_name" {
  description = "AWS EC2 Key Pair name for SSH access" 
  type        = string
}



# AMI ID
# Amazon Machine Image ID that determines the OS and software
# Default is Amazon Linux 2 which provides good compatibility and support
variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-01816d07b1128cd2d" # Amazon Linux 2023 AMI
}

# Security Group Name 
# Defines the firewall rules for the EC2 instance
# Controls inbound and outbound traffic
variable "sg_name" {
  description = "Name of the security group"
  type        = string
  default     = "web-app-sg"
}

# Tags
# Key-value pairs used to organize and identify AWS resources
# Helpful for cost allocation and resource management
variable "tags" {
  description = "Common tags for resources"
  type        = map(string)
  default     = {
    Project = "Linux Web App"
    Owner   = "Tyler"
  }
}

# Allowed IP for ssh
# CIDR block for IP addresses that can SSH into the instance
# Current default (0.0.0.0/0) allows access from anywhere - should be restricted in production
variable "allowed_ssh_ip" {
  description = "IP allowed to SSH into the instance"
  default     = "0.0.0.0/0" # Replace with your IP for security
}


locals {
  vpc_id             = data.aws_vpc.default.id
  public_subnet_ids  = data.aws_subnets.default.ids
  private_subnet_ids = data.aws_subnets.default.ids  # In default VPC, all subnets are public
}


variable "asg_desired_capacity" {
  description = "Desired number of instances in ASG"
  type        = number
  default     = 2
}

variable "asg_min_size" {
  description = "Minimum number of instances in ASG"
  type        = number
  default     = 1
}

variable "asg_max_size" {
  description = "Maximum number of instances in ASG"
  type        = number
  default     = 4
}

# S3 Bucket Name
# Name of the S3 bucket used for storing application data
# Must be globally unique across all AWS accounts
variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "my-website-bucket-1352525"
}