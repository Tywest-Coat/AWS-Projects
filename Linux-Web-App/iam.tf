
# Create an IAM role for EC2 instances to access S3
resource "aws_iam_role" "ec2_s3_access" {
  name = "ec2_s3_access_role"

  # Trust policy allowing EC2 to assume this role
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

# Attach policy to the IAM role granting S3 access permissions
resource "aws_iam_role_policy" "s3_access_policy" {
  name = "s3_access_policy"
  role = aws_iam_role.ec2_s3_access.id

  # Policy allowing GetObject and ListBucket actions on the website bucket
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:ListBucket"
        ]
        Resource = [
          aws_s3_bucket.website_bucket.arn,
          "${aws_s3_bucket.website_bucket.arn}/*"
        ]
      }
    ]
  })
}

# Create an instance profile to attach the IAM role to EC2 instances
resource "aws_iam_instance_profile" "ec2_profile" {
  depends_on = [
    aws_iam_role_policy.s3_access_policy
  ]
  name = "ec2_s3_profile"
  role = aws_iam_role.ec2_s3_access.name
}
