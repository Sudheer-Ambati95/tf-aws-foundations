output "instance_profile_name" {
  value = aws_iam_instance_profile.ec2_profile.name
}

output "iam_role_name" {
  value = aws_iam_role.ec2_role.name
}

output "instance_id" {
  value = aws_instance.app.id
}

output "launch_template_id" {
  value = aws_launch_template.app.id
}

output "instance_arn" {
  value = aws_instance.app.arn
}

