output "role_arn_jenkins" {
  description = "The role arn of jenkins instance profile"
  value       = aws_iam_instance_profile.k8s_profile.arn
}

output "role_name_jenkins" {
  description = "The role name of jenkins instance profile"
  value       = aws_iam_instance_profile.k8s_profile.name
}

output "role_id_jenkins" {
  description = "The role id of jenkins instance profile"
  value       = aws_iam_instance_profile.k8s_profile.id
}

output "role_jenkins" {
  description = "The role id of jenkins instance profile"
  value       = aws_iam_instance_profile.k8s_profile.role
}