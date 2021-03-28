variable "db_password" {
  description = "The db password"
  type = string
}

variable "db_name" {
  description = "The name to use for the database"
  type = string
  default = "stage_example_mysql_database"
}

variable "identifier_prefix" {
  default = "terraform-and-running"
}
