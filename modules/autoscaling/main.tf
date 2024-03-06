#Lighting autoscaling
resource "aws_autoscaling_group" "lighting_autoscaling_group" {
  name = "lighting"
  desired_capacity     = var.desired_capacity
  max_size             = var.max_size
  min_size             = var.min_size
  
  launch_template {
    id      = var.template_ids[0]
    version = "$Latest"
  }
}

#Lighting autoscaling attachment
resource "aws_autoscaling_attachment" "lighting_autoscaling_attachment" {
  autoscaling_group_name = aws_autoscaling_group.lighting_autoscaling_group.name
  lb_target_group_arn = var.target_group_arns[0]
}

#Heating autoscaling
resource "aws_autoscaling_group" "heating_autoscaling_group" {
  name = "heating"
  desired_capacity     = var.desired_capacity
  max_size             = var.max_size
  min_size             = var.min_size
  
  launch_template {
    id      = var.template_ids[1]
    version = "$Latest"
  }
}

#Heating autoscaling attachemnt
resource "aws_autoscaling_attachment" "heating_autoscaling_attachment" {
  autoscaling_group_name = aws_autoscaling_group.heating_autoscaling_group.name
  lb_target_group_arn = var.target_group_arns[1]
}

#Status autoscaling
resource "aws_autoscaling_group" "status_autoscaling_group" {
  name = "status"
  desired_capacity     = var.desired_capacity
  max_size             = var.max_size
  min_size             = var.min_size
  
  launch_template {
    id      = var.template_ids[2]
    version = "$Latest"
  }
}

#Status autoscaling attachemnt
resource "aws_autoscaling_attachment" "status_autoscaling_attachment" {
  autoscaling_group_name = aws_autoscaling_group.status_autoscaling_group.name
  lb_target_group_arn = var.target_group_arns[2]
}

#Auth autoscaling
resource "aws_autoscaling_group" "auth_autoscaling_group" {
  name = "auth"
  desired_capacity     = var.desired_capacity
  max_size             = var.max_size
  min_size             = var.min_size
  
  launch_template {
    id      = var.template_ids[3]
    version = "$Latest"
  }
}

#Auth autoscaling attachemnt
resource "aws_autoscaling_attachment" "auth_autoscaling_attachment" {
  autoscaling_group_name = aws_autoscaling_group.auth_autoscaling_group.name
  lb_target_group_arn = var.target_group_arns[3]
}