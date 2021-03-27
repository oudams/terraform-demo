output "s3_bucket" {
  value       = aws_s3_bucket.terraform_state.bucket
  description = "the arn of the s3 bucket"
}

output "dynamodb_table_name" {
  value       = aws_dynamodb_table.terraform_state_locks.name
  description = "the name of the dynamodb table"
}
