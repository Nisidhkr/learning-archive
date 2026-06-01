variable "sg_from_port" {
  type = list(number)
}

variable "sg_ip_protocol" {
  type = list(string)
}

variable "sg_to_port" {
  type = list(number)
}

variable "sg_cidr_ipv4" {
  type = list(string)
}

variable "key_name" {
  type = string
}

variable "sg_name" {
  type = string
}

variable "sg_tags" {
  type = map(string)
}

variable "ec2_ami_id" {
  type = string
}

variable "ec2_insatcne_type" {
  type = string
}

variable "ec2_availability_zone" {
  type = string
}

variable "ec2_tags" {
  type = map(string)
}