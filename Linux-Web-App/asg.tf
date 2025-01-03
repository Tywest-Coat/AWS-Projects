# asg.tf

# Launch Template
resource "aws_launch_template" "web_app" {
  name_prefix   = "web-app-lt"
  image_id      = var.ami_id
  instance_type = var.instance_type

  network_interfaces {
    associate_public_ip_address = true
    security_groups            = [aws_security_group.web_app_sg.id]
  }

  iam_instance_profile {
    name = aws_iam_instance_profile.ec2_profile.name
  }

  user_data = base64encode(<<-EOF
        #!/bin/bash

        # Add error handling
        set -e
    
        # Add logging
        exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

        yum update -y
        yum install -y nginx aws-cli

        systemctl start nginx
        systemctl enable nginx

        S3_BUCKET="my-website-bucket-1352525"
        FILE_PATH="index.html"

        rm -f /usr/share/nginx/html/index.html

        aws s3 cp s3://$S3_BUCKET/$FILE_PATH /usr/share/nginx/html/index.html

        chmod 644 /usr/share/nginx/html/index.html

        systemctl restart nginx

        # Add health check
        if ! systemctl is-active --quiet nginx; then
        echo "Nginx failed to start"
        exit 1
        fi
    EOF
    )

  tag_specifications {
    resource_type = "instance"
    tags = merge(var.tags, {
      Name = "web-app"
    })
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = var.tags
}

# Auto Scaling Group
resource "aws_autoscaling_group" "web_app" {
  name                = "web-app-asg"
  desired_capacity    = var.asg_desired_capacity
  max_size           = var.asg_max_size
  min_size           = var.asg_min_size
  target_group_arns  = [aws_lb_target_group.web_app.arn]
  vpc_zone_identifier = local.private_subnet_ids
  health_check_type  = "ELB"
  health_check_grace_period = 300

  launch_template {
    id      = aws_launch_template.web_app.id
    version = "$Latest"
  }

  dynamic "tag" {
    for_each = merge(var.tags, {
      Name = "web-app"
    })
    content {
      key                 = tag.key
      value              = tag.value
      propagate_at_launch = true
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}

# Scale Up Policy
resource "aws_autoscaling_policy" "scale_up" {
  name                   = "web-app-scale-up"
  autoscaling_group_name = aws_autoscaling_group.web_app.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = 1
  cooldown              = 300

  lifecycle {
    create_before_destroy = true
  }
}

# Scale Down Policy
resource "aws_autoscaling_policy" "scale_down" {
  name                   = "web-app-scale-down"
  autoscaling_group_name = aws_autoscaling_group.web_app.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = -1
  cooldown              = 300

  lifecycle {
    create_before_destroy = true
  }
}

# CloudWatch High CPU Alarm
resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name          = "web-app-high-cpu"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 70
  alarm_description   = "Scale up if CPU > 70% for 10 minutes"
  alarm_actions       = [aws_autoscaling_policy.scale_up.arn]

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.web_app.name
  }

  tags = var.tags
}

# CloudWatch Low CPU Alarm
resource "aws_cloudwatch_metric_alarm" "low_cpu" {
  alarm_name          = "web-app-low-cpu"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 30
  alarm_description   = "Scale down if CPU < 30% for 10 minutes"
  alarm_actions       = [aws_autoscaling_policy.scale_down.arn]

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.web_app.name
  }

  tags = var.tags
}
