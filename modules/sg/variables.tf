variable "vpc_id" {
  type        = string
  description = "The VPC ID that you wish to create the security groups in"
}

variable "ssh_cidr" {
  description = "CIDR block for allowed SSH traffic"
  type        = string
  default     = "86.13.109.180/32"
}

variable "cidr_0" {
  type = string
  description = "CIDR block of 0.0.0.0/0"
}

variable "cird_16" {
  type = string
  description = "CIDR block of 10.0.0.0/16"
}

variable "ipv6_cidr_block" {
  type        = string
  description = "IPv6 CIDR block"
}

variable "app_port" {
  type = number
  description = "The port apps listen on"
}

variable "http_port" {
  type = number
  description = "HTTP port 80"
}

variable "https_port" {
  type = number
  description = "HTTPS port 443"
}

variable "ssh_port" {
  type = number
  description = "SSH port 22"
  default = 22
}