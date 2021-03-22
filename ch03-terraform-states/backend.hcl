# terraform init -backend-config=backend.hcl
bucket = "terraform-up-and-running-state-outdam-demo"
region = "ap-southeast-1"
dynamodb_table = "terraform-up-and-running-demo-locks"
encrypt = true
