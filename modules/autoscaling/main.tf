resource "aws_autoscaling_group" "lighting_autoscaling_group" {
  desired_capacity     = var.desired_capacity
  max_size             = var.max_size
  min_size             = var.min_size
  
  launch_template {
    id      = [var.template_ids[0]]
    version = "$Latest"
  }
}

resource "aws_autoscaling_attachment" "autoscaling_attachment" {
  autoscaling_group_name = aws_autoscaling_group.lighting_autoscaling_group.name
  lb_target_group_arn = var.target_group_arns[0]
}