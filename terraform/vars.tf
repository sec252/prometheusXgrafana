variable "ubuntu_ami" {
  description = "Ubuntu 24.04 AMI us-east-1"
  default     = "ami-0866a3c8686eaeeba"
}

variable "prometheus_instance_type" {
  description = "Prometheus EC2 instance type"
  default     = "t2.micro"
}

variable "grafana_instance_type" {
  description = "Grafana EC2 instance type"
  default     = "t2.micro"

}

variable "prometheus_instance_name" {
  description = "Prometheus EC2 instance name"
  default     = "prometheus-test"
}

variable "grafana_instance_name" {
  description = "Grafana EC2 instance name"
  default     = "grafana-test"
}
