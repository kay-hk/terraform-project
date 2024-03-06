output "instance_ids" {
  value = [
    aws_instance.lighting_instance.id,
    aws_instance.heating_instance.id,
    aws_instance.status_instance.id,
    aws_instance.auth_instance.id,
  ]
}