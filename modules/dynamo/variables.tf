variable "table_name" {
  description = "Name of the DynamoDB table"
  type        = string
}

variable "hash_key" {
  description = "Name of the hash key"
  type        = string
}

variable "hash_key_type" {
  description = "Data type of the hash key"
  type        = string
}