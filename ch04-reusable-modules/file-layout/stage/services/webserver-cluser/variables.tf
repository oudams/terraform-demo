variable "instance_type" {
  default = "t2.micro"
}

variable "db_remote_state_bucket" {
  default = "stage-terraform-remote-state-demo-outdam"
}

variable "db_remote_state_key" {
  default = "stage/data-stores/mysql/terraform.tfstate"
}

variable "cluster_name" {
  default = "stage-webserver-cluster"
}

variable "max_scale" {
  default = 2
}

variable "min_scale" {
  default = 1
}
