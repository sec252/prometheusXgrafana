output "prometheus_instance_public_ip" {
  value = aws_instance.prometheus.public_ip

}

output "grafana_instance_public_ip" {
  value = aws_instance.grafana.public_ip

}

output "vpc_id" {
  value = aws_vpc.monitoring.id

}

output "subnet_id" {
  value = aws_subnet.public_subnet.id

}

output "security_group_id" {
  value = aws_security_group.ssh_access.id

}

output "key_pair_name" {
  value = aws_key_pair.TF-key.key_name

}
