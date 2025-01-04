# Configure the AWS Provider - credentials and region are sourced from environment variables
provider "aws" {
    # AWS credentials and region will be picked up from environment variables:
    # AWS_ACCESS_KEY_ID
    # AWS_SECRET_ACCESS_KEY
    # AWS_REGION
}

# Terraform configuration block - specifies required providers and versions
terraform {
  # Define required providers section
  required_providers {
    # AWS provider configuration
    aws = {
      source  = "hashicorp/aws"      # Use the official HashiCorp AWS provider
      version = "~> 5.0"             # Use version 5.x of the provider
    }
  }

  # Specify minimum required Terraform version
  required_version = ">= 1.4.0"      # Terraform 1.4.0 or higher is required
}
