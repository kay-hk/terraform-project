provider "aws" {
  region = "eu-west-2"
}

resource "aws_ami_from_instance" "example" {
  name               = "terraform-example"
  source_instance_id = var.instance_id
}