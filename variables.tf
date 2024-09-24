variable "aws_region" {
  description = "The AWS region to create resources in."
  default     = "us-east-1"
}

variable "ami" {
  description = "AMI ID for the EC2 instances."
  default     = "ami-0e86e20dae9224db8"
}

variable "instance_type" {
  description = "Instance type for EC2."
  default     = "t2.micro"
}
