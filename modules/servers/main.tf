data "aws_ami" "ubuntu" {
  // Gets the latest ubuntu AMI ID
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical's ID - creators of the Ubuntu AMI
}


#Lighting instance
resource "aws_instance" "lighting_instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_ids[0]
  vpc_security_group_ids = var.security_group_ids
  key_name = "cloud-project"

  tags = {
    Name = "lighting"
  }
}

#Heating instance
resource "aws_instance" "heating_instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_ids[1]
  vpc_security_group_ids = var.security_group_ids
  key_name = "cloud-project"
  tags = {
    Name = "heating"
  }
}

#Status instance
resource "aws_instance" "status_instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_ids[2]
  vpc_security_group_ids = var.security_group_ids
  key_name = "cloud-project"
  tags = {
    Name = "status"
  }
}

#Auth instance
resource "aws_instance" "auth_instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = var.private_subnet_ids[0]
  vpc_security_group_ids = var.security_group_ids
  associate_public_ip_address = false
  key_name = "cloud-project"
#NAT dependency
  depends_on = [var.NAT]

  tags = {
    Name = "auth"
  }
}