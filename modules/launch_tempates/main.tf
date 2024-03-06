resource "aws_launch_template" "lighting_launch_template" {
  name = "lighting-launch-template"

  image_id = "ami-099edd0ef84e6fa56"
  instance_type = var.instance_type
  key_name = var.key_pair

  network_interfaces {
    subnet_id = var.public_subnet_ids[0]
    associate_public_ip_address = true
    security_groups = var.security_group_ids
  }

  placement {
    availability_zone = var.azs[0]
  }
}

resource "aws_launch_template" "heating_launch_template" {
  name = "heating-launch-template"

  image_id = "ami-056fe5fff88b9ab7b"
  instance_type = var.instance_type
  key_name = var.key_pair

  network_interfaces {
    subnet_id = var.public_subnet_ids[1]
    associate_public_ip_address = true
    security_groups = var.security_group_ids
  }

  placement {
    availability_zone = var.azs[1]
  }
}

resource "aws_launch_template" "status_launch_template" {
  name = "status-launch-template"

  image_id = "ami-0d8cc99a168031500"
  instance_type = var.instance_type
  key_name = var.key_pair

  network_interfaces {
    subnet_id = var.public_subnet_ids[2]
    associate_public_ip_address = true
    security_groups = var.security_group_ids
  }

  placement {
    availability_zone = var.azs[2]
  }
}

resource "aws_launch_template" "auth_launch_template" {
  name = "auth-launch-template"

  image_id = "ami-06773d1a706caad2f"
  instance_type = var.instance_type
  key_name = var.key_pair

  network_interfaces {
    subnet_id = var.private_subnet_ids[0]
    associate_public_ip_address = false
    security_groups = var.security_group_ids
  }

  placement {
    availability_zone = var.azs[0]
  }
}