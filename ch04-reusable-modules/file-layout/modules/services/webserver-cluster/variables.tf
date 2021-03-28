# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

variable "db_remote_state_table" {
  description = "the name of the remote storage locks db"
  type        = string
  default = "terraform-remote-state-lock-demo-outdam"
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 8080
}

variable "alb_name" {
  description = "The name of the ALB"
  type        = string
  default     = "terraform-asg-example"
}

// Replaced with prefix cluster_name
//variable "instance_security_group_name" {
//  description = "The name of the security group for the EC2 Instances"
//  type        = string
//  default     = "terraform-example-instance"
//}

// Replaced with prefix cluster_name
//variable "alb_security_group_name" {
//  description = "The name of the security group for the ALB"
//  type        = string
//  default     = "terraform-example-alb"
//}

variable "cluster_name" {
  description = "The name to use for all the cluster resourcces"
  type = string
}

variable "db_remote_state_bucket" {
  description = "The name of the S3 bucket used for the database's remote state storage"
  type        = string
  //  default = "terraform-remote-state-demo-outdam"
}

variable "db_remote_state_key" {
  description = "the name of the key in the s3 bucket used for the database's remote state storage"
  type        = string
  //  default = "stage/data-stores/mysql/terraform.tfstate"
}

variable "instance_type" {
  description = "An EC2 instance type"
  type = string
}

variable "max_scale" {
  description = "The maximum number of EC2 Instances in the ASG"
  type = number
}

variable "min_scale" {
  description = "The minimum number of EC2 Instances in the ASG"
  type = number
}
