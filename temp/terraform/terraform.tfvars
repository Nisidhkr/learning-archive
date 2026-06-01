sg_from_port = [22, 8080, 443, 80]

sg_to_port = [22, 8080, 443, 80]

sg_ip_protocol = ["tcp", "tcp", "tcp", "tcp"] 

sg_cidr_ipv4 = ["0.0.0.0/0", "0.0.0.0/0", "0.0.0.0/0", "0.0.0.0/0"]

ec2_ami_id           = "ami-0ec10929233384c7f"
ec2_availability_zone = "us-east-1a"
ec2_tags = {
    Name = "module-ec2-dev"
    origin = "Terraform"
    env = "Dev"
}

sg_name = "module-sg-dev"
sg_tags = {
    Name = "module-sg-dev"
    origin = "Terraform"
    env = "Dev"
}


key_name = "dev-key-modules"
ec2_insatcne_type = "t3.micro"