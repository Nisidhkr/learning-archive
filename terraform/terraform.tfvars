ami_id = "ami-0f58b397bc5c1f2e8"

instance_type = "t3.micro"

instance_count = 3


instance_map = {
  web  = "t2.micro"
  app  = "t2.small"
  db   = "t2.medium"
}

subnet_availability_zone = ["1a","1b","1c"]
subnet_cidr = [ "10.0.0.1/24","10.0.0.2/24" ]