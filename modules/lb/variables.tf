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

variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
}

variable "http_protocol" {
    description = "HTTP protocol type"
    type        = string
}

variable "public_target_group_names" {
    description = "value"
    type = list(string)
    default = ["lighting", "heating", "status"]
}

variable "lighting_instance_id" {
    type = string
}

variable "heating_instance_id" {
    type = string
}

variable "status_instance_id" {
    type = string
}

variable "auth_instance_id" {
    type = string
}