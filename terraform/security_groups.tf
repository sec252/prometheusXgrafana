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