variable "db_password" {
  description = "The db password"
  type = string
}

variable "db_name" {
  description = "The name to use for the database"
  type = string
  default = "example_database_stage"
}
