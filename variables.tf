variable "ami_id" {
  description = "The ID of the Amazon Machine Image (AMI) to use for the instance"
  default     = "ami-0e731c8a588258d0d"
}

variable "instance_type" {
  description = "The type of EC2 instance to launch"
  default     = "t2.micro"
}

variable "instance_name" {
  description = "The name of the EC2 instance"
  default     = "My_second_instance"
}
