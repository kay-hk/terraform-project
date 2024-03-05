output "vpc_id" {
  value = aws_vpc.terraform_vpc.id

}
output "public_subnets_ids" {
  value = aws_subnet.public_subnets[*].id
}

output "private_subnets_ids" {
  value = aws_subnet.private_subnets[*].id
}

output "NAT" {
  value = aws_nat_gateway.terraform_nat_gateway.id
}