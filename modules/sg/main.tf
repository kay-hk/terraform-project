#IP data
data "http" "ssh_cidr" {
  url = "https://ipv4.icanhazip.com"
}

#Allow HTTP security group
resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow http inbound and outbound traffic"
  vpc_id      = var.vpc_id

#Rule to allow incoming connection on app port
  ingress {
    from_port         = var.app_port
    to_port           = var.app_port
    protocol          = var.protocol
    cidr_blocks       = [var.cidr_0]
    ipv6_cidr_blocks  = [var.ipv6_cidr_block]
  }

#Rule to allow incoming HTTP connections 
  ingress {
    from_port         = var.http_port
    to_port           = var.http_port
    protocol          = var.protocol
    cidr_blocks       = [var.cidr_0]
    ipv6_cidr_blocks  = [var.ipv6_cidr_block]
  }
#Rule to allow outgoing HTTP connections
  egress {
    from_port         = 0
    to_port           = 0
    protocol          = -1
    cidr_blocks       = [var.cidr_0]
    ipv6_cidr_blocks  = [var.ipv6_cidr_block]
  }
}

#Allow HTTPS security group
resource "aws_security_group" "allow_https" {
  name        = "allow_https"
  description = "Allow https inbound and outbound traffic"
  vpc_id      = var.vpc_id

#Rule to allow incoming HTTPS connections 
  ingress {
    from_port         = var.https_port
    to_port           = var.https_port
    protocol          = var.protocol
    cidr_blocks       = [var.cidr_0]
    ipv6_cidr_blocks  = [var.ipv6_cidr_block]
  }

#Rule to allow outgoing HTTPS connections 
  egress {
    from_port         = 0
    to_port           = 0
    protocol          = -1
    cidr_blocks       = [var.cidr_0]
    ipv6_cidr_blocks  = [var.ipv6_cidr_block]
  }
}

#Allow SSH security group
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic from your IP"
  vpc_id      = var.vpc_id

#Rule to allow incoming SSH connection from one IP and Cluster IPs
  ingress {
    from_port         = var.ssh_port
    to_port           = var.ssh_port
    protocol          = var.protocol
    cidr_blocks       = ["${chomp(data.http.ssh_cidr.response_body)}/32", var.cird_16]
    ipv6_cidr_blocks  = [var.ipv6_cidr_block]
  }
}