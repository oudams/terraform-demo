provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_s3_bucket" "stage_terraform_state" {
  bucket = var.stage_bucket_name

  force_destroy = true // true for test only, not recommended for prod

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_s3_bucket" "prod_terraform_state" {
  bucket = var.prod_bucket_name

  force_destroy = true // true for test only, not recommended for prod

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_dynamodb_table" "stage_terraform_state_locks" {
  name = var.stage_table_name
  hash_key = "LockID"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }
}

resource "aws_dynamodb_table" "prod_terraform_state_locks" {
  name = var.prod_table_name
  hash_key = "LockID"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }
}