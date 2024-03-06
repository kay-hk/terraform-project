# output "lighting_target_group_arn" {
#   value = aws_lb_target_group.lighting_target_group.arn
# }

# output "heating_target_group_arn" {
#   value = aws_lb_target_group.heating_target_group.arn
# }

# output "status_target_group_arn" {
#   value = aws_lb_target_group.status_target_group.arn
# }

# output "auth_target_group_arn" {
#   value = aws_lb_target_group.auth_target_group.arn
# }

output "target_group_arns" {
  value = [
    aws_lb_target_group.lighting_target_group.arn,
    aws_lb_target_group.heating_target_group.arn,
    aws_lb_target_group.status_target_group.arn,
    aws_lb_target_group.auth_target_group.arn,
  ]
}