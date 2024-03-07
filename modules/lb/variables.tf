variable "vpc_id" {
    type = string
}

variable "public_subnets_ids" {
    type = list(string)
}

variable "private_subnets_ids" {
    type = list(string)
}

variable "app_port" {
  type = number
  description = "The port apps listen on"
}

variable "http_port" {
  type = number
  description = "HTTP port 80"
}

variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
}

variable "http_protocol" {
    description = "HTTP protocol type"
    type        = string
}

variable "instance_ids" {
  type = list(string)
}