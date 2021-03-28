variable "db_password" {
  description = "The db password"
  type = string
}


variable "db_name" {
  description = "The name to use for the database"
  type = string
  default = "prod_example_mysql_database"
}

variable "state_bucket_key" {
  default = "prod/data-stores/mysql/terraform.tfstate"
}

// Values are defined in global/
variable "state_bucket_name" {
  default = "prod-terraform-remote-state-demo-outdam"
}

// Values are defined in global/
variable "locks_table" {
  default = "prod-terraform-remote-state-lock-demo-outdam"
}

variable "identifier_prefix" {
  default = "terraform-and-running"
}
