resource "aws_security_group" "ssh_access" {
  name        = "ssh_access_sg"
  description = "Allow SSH traffic for EC2 instances"

  vpc_id = aws_vpc.monitoring.id

  # Allow inbound SSH traffic from any IP address
  ingress {
    description = "Allow SSH traffic from any IP address"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow from any IP address (replace with a specific IP for better security)
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # -1 means all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "prometheus" {
  name        = "Prometheus_sg"
  description = "Allow Prometheus traffic for EC2 instances"

  vpc_id = aws_vpc.monitoring.id

  # Allow inbound Prometheus traffic from any IP address
  ingress {
    description = "Allow Prometheus traffic from any IP address"
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow from any IP address (replace with a specific IP for better security)

  }
}

resource "aws_security_group" "grafana" {
  name        = "Grafana_sg"
  description = "Allow Grafana traffic for EC2 instances"

  vpc_id = aws_vpc.monitoring.id

  # Allow inbound Grafana traffic from any IP address
  ingress {
    description = "Allow Grafana traffic from any IP address"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow from any IP address (replace with a specific IP for better security)
  }

  ingress {
    description = "Allow Prometheus traffic from any IP address"
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow from any IP address (replace with a specific IP for better security)
  }
}