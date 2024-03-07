# Target Groups for each service
resource "aws_lb_target_group" "lighting_target_group" {
  name     = "lighting-target-group"
  port     = var.app_port
  protocol = var.http_protocol
  vpc_id   = var.vpc_id

  health_check {
    enabled = true
    path                = "/api/lights/health"
  }
}

resource "aws_lb_target_group" "heating_target_group" {
  name     = "heating-target-group"
  port     = var.app_port
  protocol = var.http_protocol
  vpc_id   = var.vpc_id
    health_check {
    enabled = true
    path                = "/api/heating/health"
  }
}

resource "aws_lb_target_group" "status_target_group" {
  name     = "status-target-group"
  port     = var.app_port
  protocol = var.http_protocol
  vpc_id   = var.vpc_id
  health_check {
    enabled = true
    path                = "/api/status/health"
  }
}

#Private target group
resource "aws_lb_target_group" "auth_target_group" {
  name     = "auth-target-group"
  port     = var.app_port
  protocol = var.http_protocol
  vpc_id   = var.vpc_id

  health_check {
    enabled = true
    path                = "/api/auth"
  }
}

# Target group attachments for each service
resource "aws_lb_target_group_attachment" "lighting_target_group_attachment" {
  target_group_arn = aws_lb_target_group.lighting_target_group.arn
  target_id        = var.instance_ids[0]
  port             = var.app_port #the port app runs on
}

resource "aws_lb_target_group_attachment" "heating_target_group_attachment" {
  target_group_arn = aws_lb_target_group.heating_target_group.arn
  target_id        = var.instance_ids[1]
  port             = var.app_port
}

resource "aws_lb_target_group_attachment" "status_target_group_attachment" {
  target_group_arn = aws_lb_target_group.status_target_group.arn
  target_id        = var.instance_ids[2]
  port             = var.app_port
}


resource "aws_lb_target_group_attachment" "auth_target_group_attachment" {
  target_group_arn = aws_lb_target_group.auth_target_group.arn
  target_id        = var.instance_ids[3]
  port             = var.app_port
}

#ALB for public
resource "aws_lb" "public_lb" {
  name               = "public-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_group_ids
  subnets            = var.public_subnets_ids

  enable_deletion_protection = false

  tags = {
    Environment = "app"
  }
}

#Public load balancer listeners
resource "aws_lb_listener" "public_lb_listener" {

  load_balancer_arn = aws_lb.public_lb.arn
  port              = var.http_port #HTTP req port 80 or 443 for HTTPS
  protocol          = var.http_protocol


default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.status_target_group.arn
  }
  
}
# Rule for lighting target group
  resource "aws_lb_listener_rule" "lighting_rule" {
    listener_arn = aws_lb_listener.public_lb_listener.arn

    action {
      type             = "forward"
      target_group_arn = aws_lb_target_group.lighting_target_group.arn
    }

    condition {
      path_pattern {
        values = ["/api/lights*"]
      }
    }
  }

  # Rule for heating target group
  resource "aws_lb_listener_rule" "heating_rule" {
    listener_arn = aws_lb_listener.public_lb_listener.arn

    action {
      type             = "forward"
      target_group_arn = aws_lb_target_group.heating_target_group.arn
    }

    condition {
      path_pattern {
        values = ["/api/heating*"]
      }
    }
  }


#Private load balancer
resource "aws_lb" "private_lb" {
  name               = "private-lb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = var.security_group_ids
  subnets            = var.private_subnets_ids

  enable_deletion_protection = false

  tags = {
    Environment = "app"
  }
}

#Private load balancer listener
resource "aws_lb_listener" "private_lb_listener" {
  load_balancer_arn = aws_lb.private_lb.arn
  port              = var.http_port
  protocol          = var.http_protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.auth_target_group.arn
  }
}