provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "My_resource" {
  ami           = var.ami_id
  instance_type = var.instance_type
  tags = {
    Name = var.instance_name
  }
}
