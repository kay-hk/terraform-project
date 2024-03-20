#Autoscaling groups
resource "aws_autoscaling_group" "autoscaling_groups" {
  count = length(var.target_group_arns)
  desired_capacity     = var.desired_capacity
  max_size             = var.max_size
  min_size             = var.min_size
  force_delete = true
  
  launch_template {
    id      = var.template_ids[count.index]
    version = "$Latest"
  }
}

#Autoscaling attachments
resource "aws_autoscaling_attachment" "autoscaling_attachments" {
  count = length(var.target_group_arns)
  autoscaling_group_name = aws_autoscaling_group.autoscaling_groups[count.index].name
  lb_target_group_arn = var.target_group_arns[count.index]
}