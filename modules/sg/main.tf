resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow http inbound and outbound traffic"
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "allow_local" {
  type              = "ingress"
  from_port         = 3000
  to_port           = 3000
  protocol          = "tcp"
  cidr_blocks       = [var.cidr_0]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.allow_http.id
}

resource "aws_security_group_rule" "allow_http_ingress" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = [var.cidr_0]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.allow_http.id
}

resource "aws_security_group_rule" "allow_http_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = -1
  cidr_blocks       = [var.cidr_0]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.allow_http.id
}

resource "aws_security_group" "allow_https" {
  name        = "allow_https"
  description = "Allow https inbound and outbound traffic"
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "allow_https_ingress" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = [var.cidr_0]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.allow_https.id
}

resource "aws_security_group_rule" "allow_https_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 65535
  protocol          = -1
  cidr_blocks       = [var.cidr_0]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.allow_https.id
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic from your IP"
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "allow_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [var.ssh_cidr]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.allow_ssh.id
}