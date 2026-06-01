


#file 1
# terraform {
#   required_providers {
#     oci = {
#       source  = "oracle/oci"
#       version = "8.5.0"
#     }
#   }
# }

# provider "oci" {
#   # Configuration options
# }
# -----------------------------------------------------------------------------------------
# file 2
#resource "local_file" "my_file" {
#   content  = "This is a sample file created by Terraform."
#   filename = "${path.module}/sample.txt"
 
# }

# -----------------------------------------------------------------------------------------
# file 3
# provider "aws" {
#   region = "ap-south-1"
# }

# # Security Group
# resource "aws_security_group" "web_sg" {
#   name = "web-sg"

#   # SSH (port 22)
#   ingress {
#     description = "SSH"
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   # HTTP (port 80)
#   ingress {
#     description = "HTTP"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   # HTTPS (port 443)
#   ingress {
#     description = "HTTPS"
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   # Outbound (allow all)
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

# #  EC2 Instance
# resource "aws_instance" "my_ec2" {
#   ami           = "ami-03f4878755434977f"
#   instance_type = "t3.micro"

#
#   vpc_security_group_ids = [aws_security_group.web_sg.id]

#   user_data = <<-EOF
#               #!/bin/bash
#               apt update -y
#               apt install -y nginx
#               systemctl start nginx
#               systemctl enable nginx
#               echo "<h1>Hello Nisidh </h1>" > /var/www/html/index.html
#               EOF

#   tags = {
#     Name = "nisidh-server"
#   }
# }

# output "public_ip" {
#   value = aws_instance.my_ec2.public_ip
# }

# -----------------------------------------------------------------------------------------
#file 4
# provider "aws" {
#   region = "ap-south-1"
# }

# resource "aws_vpc" "my_vpc" {
#   cidr_block = "10.0.0.0/16"
#   instance_tenancy = "default"
#   tags = {
#     Name = "my-vpc"
#   }
 
# }

# resource "aws_subnet" "public_subnet" {
#   vpc_id     = aws_vpc.my_vpc.id
#   cidr_block = "10.0.1.0/24"

#   tags = {
#     Name = "public-subnet"
#   }
# }

# resource "aws_subnet" "private_subnet" {
#   vpc_id     = aws_vpc.my_vpc.id
#   cidr_block = "10.0.2.0/24"

#   tags = {
#     Name = "private-subnet"
#   }
# }
# resource "aws_internet_gateway" "gw" {
#   vpc_id = aws_vpc.my_vpc.id

#   tags = {
#     Name = "main"
#   }
# }


# resource "aws_nat_gateway" "example" {

#   subnet_id     = aws_subnet.private_subnet.id

#   tags = {
#     Name = "gw NAT"
#   }

#   # To ensure proper ordering, it is recommended to add an explicit dependency
#   # on the Internet Gateway for the VPC.
#   depends_on = [aws_internet_gateway.gw]
# }



# resource "aws_route_table" "public" {
#   vpc_id = aws_vpc.my_vpc.id

#   route {
#     cidr_block           = "0.0.0.0/0"
#     gateway_id           = aws_internet_gateway.gw.id
#   }
#   tags = {
#     "Name" = "public-route-table"
#   }
# }

# resource "aws_route_table" "private" {
#   vpc_id = aws_vpc.my_vpc.id

#   route {
#     cidr_block           = "0.0.0.0/0"
#     nat_gateway_id       = aws_nat_gateway.example.id
 
#   }
#   tags = {
#     "Name" = "private-route-table"
#   }
# }

# resource "aws_route_table_association" "a" {
#   subnet_id      = aws_subnet.public_subnet.id
#   route_table_id = aws_route_table.public.id
# }

# resource "aws_route_table_association" "b" {
#   subnet_id      = aws_subnet.private_subnet.id
#   route_table_id = aws_route_table.private.id
# }



# ----------------------------------------------------------------------------
#file 5
 # for count and for_each example

# provider "aws" {
#   region = var.aws_region
# }


# resource "aws_instance" "count_example" {
#   count = var.instance_count

#   ami           = var.ami_id
#   instance_type = var.instance_type

#   tags = {
#     Name = "Count-Instance-${count.index}"
#   }
# }

# resource "aws_instance" "foreach_example" {
#   for_each = var.instance_map

#   ami           = var.ami_id
#   instance_type = each.value

#   tags = {
#     Name = "ForEach-${each.key}"
#   }
# }

#------------------------------------------------------------------------------------------------------


#file 6


# creation of ec2 instance

# required items are:
# 1. AMI ID     t
# 2. Instance Type t
# 3. Security Group  t
# 4. keyy      t
# 5. vpc and subnet

# provider "aws" {
#    region = "ap-south-1"
#  }

#  resource "aws_vpc" "my_vpc" {
#    cidr_block = "10.0.0.0/16"
 
#  }

# resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
#   security_group_id = aws_security_group.allow_tls.id
#   cidr_ipv4         = aws_vpc.main.cidr_block
#   from_port         = 443
#   ip_protocol       = "tcp"
#   to_port           = 443

# }

# resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv4" {
#   security_group_id = aws_security_group.allow_tls.id
#   cidr_ipv4         = aws_vpc.main.cidr_block
#   from_port         = 80
#   ip_protocol       = "tcp"
#   to_port           = 80

# }



# resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
#   security_group_id = aws_security_group.allow_tls.id
#   cidr_ipv4         = "0.0.0.0/0"
#   ip_protocol       = "-1" # semantically equivalent to all ports
# }
 resource "aws_key_pair" "my_key" {
   key_name   = "my-key"
   public_key = file("/home/nisidh-kumar/learning-archive/testgdgbu_id_key.txt.pub")
 }


# resource "aws_instance" "ec2_instance" {
#   ami           = var.ami_id
#   instance_type = var.instance_type
#   security_groups = ["aws_security_group.allow_tls.id"]
#   key_name = aws_key_pair.my_key.key_name





 
 
# }





#------------------------------------------------------------------------------------------------------


#file 7


# Create VPC with:
# * 2 public + 2 private subnets (multi-AZ)
# Internet Gateway + NAT Gateway
# * Deploy ALB (public)
# Route HTTP traffic to backend
# * Create Launch Template + Auto Scaling Group
# Instances in private subnet
# * Min: 2, Max: 5
# Install Nginx
# Configure Security Groups
# * Allow HTTP → ALB
# * Allow ALB → EC2 only
# Create RDS (MySQL/Postgres)
# * Private subnet
# * Accessible only from EC2
# Create S3 bucket
# * Enable versioning


# Use modules (VPC, EC2, RDS)
# Use variables (region, instance type, DB name)
# Support dev & prod environments
# Conditional logic:
# * dev → 1 instance
# * prod → autoscaling
# Add lifecycle rule
# * Prevent DB deletion

# provider "aws" {
#   region = var.aws_region

# }


# resource "aws_vpc" "my-vpc" {
# cidr_block = "10.0.0.0/16"
# tags = {
#   Name = "my-vpc"
# }
 
# }

# resource "aws_subnet" "my-subnet-pub-01" {
#   count = lenght(var.subnet_cidr)
#   vpc_id = aws_vpc.my-vpc
#   cidr_block = var.subnet_cidr[count.index]
 
#   availability_zone = "ap-south-${var.subnet_availability_zone[count.index]}"
#   tags = {
#     name = "my-subnet-pub-0${var.subnet_cidr[count.index]}"
#   }
 
# }




/// ---------------------








