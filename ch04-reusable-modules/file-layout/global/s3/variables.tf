variable "stage_bucket_name" {
  description = "The name of the S3 Bucket for remote states"
  type        = string
  default = "stage-terraform-remote-state-demo-outdam"
}

variable "prod_bucket_name" {
  description = "The name of the S3 Bucket for remote states"
  type        = string
  default = "prod-terraform-remote-state-demo-outdam"
}

variable "prod_table_name" {
  description = "The name of the DynamoDB table. This is for state lock"
  type        = string
  default = "prod-terraform-remote-state-lock-demo-outdam"
}

variable "stage_table_name" {
  description = "The name of the DynamoDB table. This is for state lock"
  type        = string
  default = "stage-terraform-remote-state-lock-demo-outdam"
}