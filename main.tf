provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "My_resource" {
    ami           = "ami-0e731c8a588258d0d"
    instance_type = "t2.micro"
    tags = {
        Name = "My_second_instance"
    }
}