output "instance_public_ip" {
  value = aws_instance.my_ec2.public_ip
}

output "load_balancer_dns_name" {
  value = aws_lb.my_lb.dns_name
}
