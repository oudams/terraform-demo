provider "aws" {
  region = "ap-southeast-1"
}

module "webserver_cluster" {
  source = "../../../../modules/services/webserver-cluster"

  ami        = "ami-01581ffba3821cdf3"
  server_text = var.server_text

  cluster_name           = var.cluster_name
  db_remote_state_bucket = var.db_remote_state_bucket
  db_remote_state_key    = var.db_remote_state_key

  instance_type      = "m4.large"
  min_size           = 2
  max_size           = 10
  enable_autoscaling = true
}

