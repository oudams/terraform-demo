provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "example" {
  ami           = "ami-01581ffba3821cdf3"
  instance_type = "t2.micro"
}

terraform {
  backend "s3" {
    key = "workspaces-example/terraform.rfstate"
    bucket = "terraform-up-and-running-state-outdam-demo"
    region = "ap-southeast-1"
    dynamodb_table = "terraform-up-and-running-demo-locks"
    encrypt = true
  }
}

output "current_workspace" {
  value = terraform.workspace
  description = "Current workspace"
}
