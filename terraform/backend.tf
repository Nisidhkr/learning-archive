terraform {
  backend "s3" {
    bucket         = "terraform-tfstate-nisidh"   
    key            = "global/terraform.tfstate"   
    region         = "ap-south-1"                
    encrypt        = true                        
               
  }
}
