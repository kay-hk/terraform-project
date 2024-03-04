output "vpc_id" {
  value = aws_vpc.terraform_vpc.id

}
output "public_subnets_ids" {
  value = aws_subnet.public_subnets[*].id
}
