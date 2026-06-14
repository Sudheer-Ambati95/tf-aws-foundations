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

