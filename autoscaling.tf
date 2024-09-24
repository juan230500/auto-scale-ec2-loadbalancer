# Launch Template
resource "aws_launch_template" "my_launch_template" {
  name          = "my-launch-template"
  image_id      = "ami-0e86e20dae9224db8"
  instance_type = "t2.micro"

  network_interfaces {
    security_groups = [aws_security_group.my_sg.id]
    subnet_id       = aws_subnet.my_subnet_1.id
  }
}

# Auto Scaling Group
resource "aws_autoscaling_group" "my_asg" {
  launch_template {
    id      = aws_launch_template.my_launch_template.id
    version = "$Latest"
  }

  vpc_zone_identifier       = [aws_subnet.my_subnet_1.id, aws_subnet.my_subnet_2.id]
  min_size                  = 1
  max_size                  = 2
  desired_capacity          = 1
  health_check_type         = "EC2"
  health_check_grace_period = 300
}

# Scaling Policies
resource "aws_autoscaling_policy" "scale_up" {
  name                   = "scale-up-policy"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = aws_autoscaling_group.my_asg.name
}

resource "aws_autoscaling_policy" "scale_down" {
  name                   = "scale-down-policy"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = aws_autoscaling_group.my_asg.name
}
