output "vpc_id" { value = module.shared_resources.vpc_id }
output "default_route_table_id" { value = module.shared_resources.default_route_table_id }
output "default_security_group_id" { value = module.shared_resources.default_security_group_id }
output "route_table_ids" { value = module.shared_resources.route_table_ids }
output "selected_azs" { value = module.shared_resources.selected_azs }

output "credentials_id" { value = module.shared_resources.credentials_id }

output "uc_metastore_id" { value = module.shared_resources.uc_metastore_id }
output "aws_role_uc_access_arn" { value = module.shared_resources.aws_role_uc_access_arn }