resource "aws_key_pair" "test_ec2" {
  key_name   = var.key_name
  public_key = var.ssh_public_key
}

resource "aws_security_group" "ec2_sg" {
  name        = var.sg_name
  vpc_id      = var.vpc_id
  tags = var.sg_tags
}

resource "aws_vpc_security_group_ingress_rule" "allow_ports" {
    count = length(var.sg_from_port)
  security_group_id = aws_security_group.ec2_sg.id
  from_port         = var.sg_from_port[count.index]
  ip_protocol       = var.sg_ip_protocol[count.index]
  to_port           = var.sg_to_port[count.index]
  cidr_ipv4 = var.sg_cidr_ipv4[count.index]
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.ec2_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_instance" "ec2_insatcne" {
  ami           = var.ec2_ami_id
  instance_type = var.ec2_insatcne_type
  associate_public_ip_address = true
  availability_zone = var.ec2_availability_zone
  root_block_device {
    delete_on_termination = true
    volume_size = 10
    volume_type = "gp3"
  }
  ebs_block_device {
    device_name = "/dev/sdb"
    delete_on_termination = true
    volume_size = 50
    volume_type = "gp3"
    tags = {
      "Created_by" = "Terraform"
    }
  }
  key_name = aws_key_pair.test_ec2.key_name
  security_groups = [aws_security_group.ec2_sg.id]
  subnet_id = var.subnet_id
  tags = var.ec2_tags
}