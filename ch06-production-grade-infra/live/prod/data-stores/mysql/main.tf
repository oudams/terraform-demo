terraform {
  required_version = ">= 0.12, < 0.13"
}

provider "aws" {
  region = "ap-southeast-1"

  # Allow any 2.x version of the AWS provider
  version = "~> 2.0"
}

terraform {
  backend "s3" {
    bucket         = "stage-tf-remote-state-tf-up-and-running"
    key            = "stage/data-stores/mysql/terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "stage-tf-remote-state-lock-tf-up-and-running"
    encrypt        = true
  }
}

resource "aws_db_instance" "example" {
  identifier_prefix   = "terraform-up-and-running"
  engine              = "mysql"
  allocated_storage   = 10
  instance_class      = "db.t2.micro"
  name                = var.db_name
  username            = "admin"
  password            = var.db_password
  skip_final_snapshot = true
}
