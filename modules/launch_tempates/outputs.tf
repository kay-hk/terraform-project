output "template_ids" {
  value = [
    aws_launch_template.lighting_launch_template.id,
    aws_launch_template.heating_launch_template.id,
    aws_launch_template.status_launch_template.id,
    aws_launch_template.auth_launch_template.id,
  ]
}