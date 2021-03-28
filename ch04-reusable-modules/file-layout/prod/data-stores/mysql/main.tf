provider "aws" {
  region = "ap-southeast-1"
}

terraform {
  backend "s3" {
    bucket         = var.state_bucket_name
    key            = var.state_bucket_key
    region         = "ap-southeast-1"
    dynamodb_table = var.locks_table
    encrypt        = true
  }
}

resource "aws_db_instance" "example" {
  name = var.db_name
  password = var.db_password
  username = "admin"
  instance_class = "db.t2.micro"
  skip_final_snapshot = true
  allocated_storage = 10
  engine = "mysql"
  identifier_prefix = var.identifier_prefix
}