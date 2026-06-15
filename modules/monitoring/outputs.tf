output "flow_log_id" {
  value = aws_flow_log.vpc.id
}

output "log_group_name" {
  value = aws_cloudwatch_log_group.vpc_flow_logs.name
}

output "cloudwatch_agent_parameter" {
  value = aws_ssm_parameter.cloudwatch_agent_config.name
}
