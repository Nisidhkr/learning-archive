# variable "aws_region" {
#   default = "ap-south-1"
# }

variable "ami_id" {
  description = "AMI ID for EC2"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "instance_count" {
  description = "Number of instances for count"
  default     = 2
}

variable "instance_map" {
  description = "Map for for_each example"
  type        = map(string)
}

variable "subnet_cidr" {
  description = "no of subnet for count"
  type = list(string)
  }

variable "subnet_availability_zone" {
  type = list(string)
}

