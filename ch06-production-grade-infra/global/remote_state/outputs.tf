output "stage_s3_bucket" {
  value       = aws_s3_bucket.stage_terraform_state.bucket
  description = "stage the arn of the s3 bucket for locks"
}

output "stage_dynamodb_table_name" {
  value       = aws_dynamodb_table.stage_terraform_state_locks.name
  description = "stage the name of the dynamodb table state"
}

output "prod_s3_bucket" {
  value       = aws_s3_bucket.prod_terraform_state.bucket
  description = "prod the arn of the s3 bucket for state"
}

output "prod_dynamodb_table_name" {
  value       = aws_dynamodb_table.prod_terraform_state_locks.name
  description = "prod the name of the dynamodb table for locks"
}
//prod_dynamodb_table_name = "prod-ft-remote-state-lock-tf-up-and-running"
//prod_s3_bucket = "prod-tf-remote-state-tf-up-and-running"
//stage_dynamodb_table_name = "stage-tf-remote-state-lock-tf-up-and-running"
//stage_s3_bucket = "stage-tf-remote-state-tf-up-and-running"
