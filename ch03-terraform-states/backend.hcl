# terraform init -backend-config=backend.hcl
bucket = "terraform-up-and-running-state-outdam-demo"
region = "ap-southeast-1"
encrypt = true
dynamodb_table = "terraform-up-and-running-demo-locks"
