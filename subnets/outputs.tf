output "private-subnet-1" {
  description = "The ID of the VPC"
  value       = aws_subnet.private_subnet-1
}


output "public-subnet-1" {
  description = "The ID of the VPC"
  value       = aws_subnet.public_subnet-1
}
