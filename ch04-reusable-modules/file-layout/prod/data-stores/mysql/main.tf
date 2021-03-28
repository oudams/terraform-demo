provider "aws" {
  region = "ap-southeast-1"
}

terraform {
  backend "s3" {
    bucket         = "prod-terraform-remote-state-demo-outdam"
    key            = "prod/data-stores/mysql/terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "prod-terraform-remote-state-lock-demo-outdam"
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