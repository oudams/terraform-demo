variable "stage_bucket_name" {
  description = "Stage - The name of the S3 Bucket for remote states"
  type        = string
  default = "stage-tf-remote-state-tf-up-and-running"
}

variable "prod_bucket_name" {
  description = "Prod - The name of the S3 Bucket for remote states"
  type        = string
  default = "prod-tf-remote-state-tf-up-and-running"
}

variable "stage_table_name" {
  description = "Stage - The name of the DynamoDB table. This is for state lock"
  type        = string
  default = "stage-tf-remote-state-lock-tf-up-and-running"
}

variable "prod_table_name" {
  description = "Prod - The name of the DynamoDB table. This is for state lock"
  type        = string
  default = "prod-ft-remote-state-lock-tf-up-and-running"
}
