variable "db_password" {
  description = "The db password"
  type = string
}

variable "db_name" {
  description = "The name to use for the database"
  type = string
  default = "stage_example_mysql_database"
}

variable "state_bucket_key" {
  default = "stage/data-stores/mysql/terraform.tfstate"
}

// Values are defined in global/
variable "state_bucket_name" {
  default = "stage-terraform-remote-state-demo-outdam"
}

// Values are defined in global/
variable "locks_table" {
  default = "prod-terraform-remote-state-lock-demo-outdam"
}
