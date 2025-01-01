# EC2 Public IP
output "ec2_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.web_app.public_ip
}

# Security Group ID
output "security_group_id" {
  description = "ID of the Security Group"
  value       = aws_security_group.web_app_sg.id
}
