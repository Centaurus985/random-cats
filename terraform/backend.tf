terraform {
  required_version = ">= 1.5.0"
  
  backend "s3" {
    bucket         = "terraform-state-bucket-358140414416-ap-southeast-2-an"
    key            = "production/terraform.tfstate"
    region         = "ap-southeast-2"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true # Server-side encryption
  }
}