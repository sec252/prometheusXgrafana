resource "aws_instance" "prometheus" {
  ami                    = var.ubuntu_ami
  instance_type          = var.prometheus_instance_type
  key_name               = aws_key_pair.TF-key.key_name
  vpc_security_group_ids = [aws_security_group.ssh_access.id]
  subnet_id              = aws_subnet.public_subnet.id
  tags = {
    Name = var.prometheus_instance_name
  }
}

resource "aws_instance" "grafana" {
  ami                    = var.ubuntu_ami
  instance_type          = var.grafana_instance_type
  key_name               = aws_key_pair.TF-key.key_name
  vpc_security_group_ids = [aws_security_group.ssh_access.id]
  subnet_id              = aws_subnet.public_subnet.id
  tags = {
    Name = var.grafana_instance_name
  }
}

resource "aws_key_pair" "TF-key" {
  key_name   = "TF-key"
  public_key = tls_private_key.ed.public_key_openssh
}

resource "tls_private_key" "ed" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "TF-key" {
  content  = tls_private_key.ed.private_key_pem
  filename = "${path.module}/../key/tfkey.pem"
  file_permission = "0600"
}

resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/inventory.tpl", {
    prometheus_ip = aws_instance.prometheus.public_ip
    grafana_ip    = aws_instance.grafana.public_ip
  })
  filename = "${path.module}/../ansible/inventory.ini"
}