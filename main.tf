provider "aws" {
  region = "us-east-1" # Replace with your preferred AWS region
}

# Include other resource files
module "vpc" {
  source = "./vpc.tf"
}

module "security_groups" {
  source = "./security_groups.tf"
}

module "ec2" {
  source = "./ec2.tf"
}

module "load_balancer" {
  source = "./load_balancer.tf"
}

module "autoscaling" {
  source = "./autoscaling.tf"
}
