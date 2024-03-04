output "lighting_instance_id" {
    value = aws_instance.lighting_instance.id
}

output "heating_instance_id" {
    value = aws_instance.heating_instance.id
}

output "status_instance_id" {
    value = aws_instance.status_instance.id
}

output "auth_instance_id" {
  value = aws_instance.auth_instance.id
}
