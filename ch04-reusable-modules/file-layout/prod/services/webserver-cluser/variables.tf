variable "instance_type" {
  default = "t2.micro"
}

variable "db_remote_state_bucket" {
  default = "prod-terraform-remote-state-demo-outdam"
}

variable "db_remote_state_key" {
  default = "prod/data-stores/mysql/terraform.tfstate"
}

variable "cluster_name" {
  default = "prod-webserver-cluster"
}

variable "max_scale" {
  default = 4
}

variable "min_scale" {
  default = 3
}
