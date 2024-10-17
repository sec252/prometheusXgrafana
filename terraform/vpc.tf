# Create a simple VPC
resource "aws_vpc" "monitoring" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "monitoring-vpc"
  }
}

# Create an Internet Gateway for the VPC
resource "aws_internet_gateway" "monitoring" {
  vpc_id = aws_vpc.monitoring.id
  tags = {
    Name = "monitoring-igw"
  }
}

# Create a public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.monitoring.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true # Automatically assign public IPs
  tags = {
    Name = "public_subnet"
  }
}

# Create a route table for the public subnet
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.monitoring.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.monitoring.id # Route all traffic through the Internet Gateway
  }
  tags = {
    Name = "public-route-table"
  }
}

# Associate the public route table with the public subnet
resource "aws_route_table_association" "public_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public.id
}
