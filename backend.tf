terraform {
  backend "s3" {
    bucket = "terraform-kaveri-bucket"
    key    = "terraform/terraform.tfstate"
    region = "ap-south-1"
  }
}