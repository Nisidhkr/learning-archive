
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
# resource "local_file" "my_file" {
#   content  = "This is a sample file created by Terraform."
#   filename = "${path.module}/sample.txt"
  
# }

# -----------------------------------------------------------------------------------------

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

#   # Attach SG created above
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