variable "bucket_name" {
  description = "The name of the S3 Bucket for remote states"
  type        = string
  default = "terraform-remote-state-demo-outdam"
}

variable "table_name" {
  description = "The name of the DynamoDB table. This is for state lock"
  type        = string
  default = "terraform-remote-state-lock-demo-outdam"
}