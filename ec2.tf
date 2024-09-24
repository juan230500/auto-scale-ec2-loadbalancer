# EC2 Instance
resource "aws_instance" "my_ec2" {
  ami             = "ami-0e86e20dae9224db8"
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.my_subnet_1.id
  security_groups = [aws_security_group.my_sg.id]
}
