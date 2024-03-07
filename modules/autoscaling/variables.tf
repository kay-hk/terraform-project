variable "template_ids" {
  type = list(string)
}

variable "desired_capacity" {
  type = number
  default = 2
}

variable "max_size" {
  type = number
  default = 3
}

variable "min_size" {
  type = number
  default = 2
}

variable "target_group_arns" {
  type = list(string)
}
