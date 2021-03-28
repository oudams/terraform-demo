output "stage_s3_bucket" {
  value       = aws_s3_bucket.stage_terraform_state.bucket
  description = "the arn of the s3 bucket"
}

output "stage_dynamodb_table_name" {
  value       = aws_dynamodb_table.stage_terraform_state_locks.name
  description = "the name of the dynamodb table"
}

output "prod_s3_bucket" {
  value       = aws_s3_bucket.prod_terraform_state.bucket
  description = "the arn of the s3 bucket"
}

output "prod_dynamodb_table_name" {
  value       = aws_dynamodb_table.prod_terraform_state_locks.name
  description = "the name of the dynamodb table"
}
