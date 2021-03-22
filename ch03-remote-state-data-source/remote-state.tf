resource "aws_s3_bucket" "s3_bucket_terraform_state" {

  bucket = "terraform-up-and-running-state-outdam-demo-remote-state"

  lifecycle {
    prevent_destroy = true
  }

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

resource "aws_dynamodb_table" "dynamodb_terraform_state_locks" {
  name = "terraform-up-and-running-demo-remote-state-locks"
  hash_key = "LockID"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "LockID"
    type = "S"
  }
}

terraform {
  backend "s3" {
    key = "global/s3/terraform.rfstate"
  }
}

output "s3_bucket_arn" {
  value = aws_s3_bucket.s3_bucket_terraform_state.arn
  description = "The ARN of the S3 Bucket Update"
}

output "dynamodb_table_name" {
  value = aws_dynamodb_table.dynamodb_terraform_state_locks.name
  description = "The name of the DynamoDB table"
}
