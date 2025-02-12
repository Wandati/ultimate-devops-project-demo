provider "aws" {
    region = "af-south-1"
  
}

resource "aws_s3_bucket" "terraform_state_bucket" {
    bucket = "demo-eks-terraform-states3-bucket"
    lifecycle {
        prevent_destroy = false
    }
  
}

resource "aws_dynamodb_table" "terraform_state_lock" {
    name           = "demo-eks-terraform-state-lock"
    billing_mode   = "PAY_PER_REQUEST"
    hash_key       = "LockID"
    attribute {
        name = "LockID"
        type = "S"
    }
    tags = {
        Name = "demo-eks-terraform-state-lock"
    }
  
}
