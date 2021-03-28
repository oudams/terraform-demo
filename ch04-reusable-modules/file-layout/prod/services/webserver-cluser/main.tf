provider "aws" {
  region = "ap-southeast-1"
}

module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"

  cluster_name = var.cluster_name
  db_remote_state_bucket = var.db_remote_state_bucket
  db_remote_state_key = var.db_remote_state_key
  instance_type = var.instance_type
  max_scale = var.max_scale
  min_scale = var.min_scale
}