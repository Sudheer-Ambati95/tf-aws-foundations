output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_1_id" {
  value = module.vpc.public_subnet_1_id
}

output "public_subnet_2_id" {
  value = module.vpc.public_subnet_2_id
}

output "internet_gateway_id" {
  value = module.vpc.internet_gateway_id
}

output "public_route_table_id" {
  value = module.vpc.public_route_table_id
}

output "private_app_subnet_1_id" {
  value = module.vpc.private_app_subnet_1_id
}

output "private_app_subnet_2_id" {
  value = module.vpc.private_app_subnet_2_id
}

output "private_db_subnet_1_id" {
  value = module.vpc.private_db_subnet_1_id
}

output "private_db_subnet_2_id" {
  value = module.vpc.private_db_subnet_2_id
}

output "nat_gateway_id" {
  value = module.vpc.nat_gateway_id
}

output "private_route_table_id" {
  value = module.vpc.private_route_table_id
}

output "alb_sg_id" {
  value = module.security_group.alb_sg_id
}

output "app_sg_id" {
  value = module.security_group.app_sg_id
}

output "db_sg_id" {
  value = module.security_group.db_sg_id
}

output "flow_log_id" {
  value = module.monitoring.flow_log_id
}

output "log_group_name" {
  value = module.monitoring.log_group_name
}

output "ec2_role_name" {
  value = module.ec2.iam_role_name
}

output "instance_profile_name" {
  value = module.ec2.instance_profile_name
}

output "instance_id" {
  value = module.ec2.instance_id
}

output "launch_template_id" {
  value = module.ec2.launch_template_id
}

output "cloudwatch_agent_parameter" {
  value = module.monitoring.cloudwatch_agent_parameter
}

