output "vpc_id" { value = module.example_vpc.vpc_id }
output "default_route_table_id" { value = module.example_vpc.default_route_table_id }
output "default_security_group_id" { value = module.example_vpc.default_security_group_id }
output "route_table_ids" { value = module.example_vpc.route_table_ids }
output "selected_azs" { value = module.example_vpc.selected_azs }

output "credentials_id" { value = module.example_cred.credentials_id }

output "uc_metastore_id" { value = module.example_ucms.uc_metastore_id }
output "aws_role_uc_access_arn" { value = module.example_ucms.aws_role_uc_access_arn }