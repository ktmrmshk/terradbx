output "vpc_id" { value = module.vpc.vpc_id }
output "default_route_table_id" { value = module.vpc.default_route_table_id }
output "default_security_group_id" { value = module.vpc.default_security_group_id }
output "route_table_ids" { value = module.vpc.private_route_table_ids }
output "selected_azs" { value = local.selected_azs }