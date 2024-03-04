variable "table_names" {
  description = "Names of the DynamoDB tables"
  type        = list(string)
}

variable "hash_key" {
  description = "Name of the hash key"
  type        = string
}

variable "hash_key_type" {
  description = "Data type of the hash key"
  type        = string
}