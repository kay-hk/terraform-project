resource "aws_vpc" "terraform_vpc" {
  cidr_block       = var.cird_16
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "terraform_vpc"
  }
}

//Public subnets
resource "aws_subnet" "public_subnets" {
  count = length(var.public_subnets)
  vpc_id     = aws_vpc.terraform_vpc.id
  cidr_block        = var.public_subnets[count.index]
  map_public_ip_on_launch = true
  availability_zone = var.azs[count.index]

  tags = {
    Name = "public_subnets-${count.index + 1}"
  }
}

//Private subnets
resource "aws_subnet" "private_subnets" {
  count = length(var.private_subnets)
  vpc_id     = aws_vpc.terraform_vpc.id
  cidr_block = var.private_subnets[count.index]
  map_public_ip_on_launch = false
  availability_zone = var.azs[count.index]

  tags = {
    Name = "private_subnets-${count.index + 1}"
  }
}

//Internet gateway
resource "aws_internet_gateway" "terraform-internet-gateway" {
  vpc_id = aws_vpc.terraform_vpc.id

  tags = {
    Name = "tf-internet-gateway"
  }
}

# Elastic IP
resource "aws_eip" "nat_gateway_eip" {
  count = 1
  depends_on = [aws_internet_gateway.terraform-internet-gateway]

  tags = {
    Name = "tf-nat-gateway-eip-1"
  }
}

# NAT Gateway
resource "aws_nat_gateway" "terraform_nat_gateway" {
  subnet_id       = aws_subnet.public_subnets[0].id 
  allocation_id   = aws_eip.nat_gateway_eip[0].id

  tags = {
    Name = "tf-nat-gateway-1"
  }
}

# Public route table (with NAT Gateway)
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.terraform_vpc.id

  route {
    cidr_block     = var.cidr_0
    gateway_id      = aws_internet_gateway.terraform-internet-gateway.id
  }

  tags = {
    Name = "tf-public-route-table"
  }
}

# Private route table (with NAT Gateway)
resource "aws_route_table" "private_route_table" {
  count = length(var.azs)
  vpc_id = aws_vpc.terraform_vpc.id

  route {
    cidr_block     = var.cidr_0
    nat_gateway_id = aws_nat_gateway.terraform_nat_gateway.id
  }

  tags = {
    Name = "tf-private-route-table-${count.index + 1}"
  }
}

# Public subnet associations
resource "aws_route_table_association" "public_subnet_association" {
  count          = length(aws_subnet.public_subnets[*])
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}

# Private subnet associations
resource "aws_route_table_association" "private_subnet_association" {
  count          = length(aws_subnet.private_subnets[*])
  subnet_id      = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.private_route_table[count.index].id
}