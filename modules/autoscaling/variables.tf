# variable "lighting_template_id" {
#   type = string
#   description = "ID of Lighting Launch Template"
# }

# variable "heating_template_id" {
#   type = string
#   description = "ID of Heating Launch Template"
# }

# variable "status_template_id" {
#   type = string
#   description = "ID of Status Launch Template"
# }

# variable "auth_template_id" {
#   type = string
#   description = "ID of Auth Launch Template"
# }

variable "template_ids" {
  type = list(string)
}

variable "desired_capacity" {
  type = number
}

variable "max_size" {
  type = number
}

variable "min_size" {
  type = number
}

variable "target_group_arns" {
  type = list(string)
}
