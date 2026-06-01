module "ec2" {
  source = "./modules/ec2"
  ec2_ami_id = var.ec2_ami_id
  ec2_availability_zone = var.ec2_availability_zone
  ec2_tags = var.ec2_tags
  key_name = var.key_name
  sg_cidr_ipv4 = var.sg_cidr_ipv4
  sg_from_port = var.sg_from_port
  sg_ip_protocol = var.sg_ip_protocol
  sg_to_port = var.sg_to_port
  sg_name = var.sg_name
  sg_tags = var.sg_tags
  ssh_public_key = file("~/.ssh/id_rsa.pub")
  subnet_id = data.aws_subnet.existing_subnet.id
  vpc_id = data.aws_subnet.existing_subnet.vpc_id
  ec2_insatcne_type = var.ec2_insatcne_type
}