data "aws_subnet" "existing_subnet" {
  availability_zone = "us-east-1a"
  cidr_block = "172.31.16.0/20"
}