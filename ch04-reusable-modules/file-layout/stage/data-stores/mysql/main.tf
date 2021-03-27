terraform {
  backend "s3" {
    bucket         = "terraform-remote-state-demo-outdam"
    key            = "stage/data-stores/mysql/terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "terraform-remote-state-lock-demo-outdam"
    encrypt        = true
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_db_instance" "example" {
  name = var.db_name
  password = var.db_password
  username = "admin"
  instance_class = "db.t2.micro"
  skip_final_snapshot = true
  allocated_storage = 10
  engine = "mysql"
  identifier_prefix = "terraform-up-and-running-demo"
}