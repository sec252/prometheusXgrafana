terraform {
  backend "s3" {
    bucket         = "prometheus-grafana-terraform-state"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "prometheus-grafana-terraform-state-lock"
  }
}