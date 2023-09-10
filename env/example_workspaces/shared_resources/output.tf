output "vpc_id" { value = module.exapmle_vpc.vpc_id }
output "default_route_table_id" { value = module.exapmle_vpc.default_route_table_id }
output "default_security_group_id" { value = module.exapmle_vpc.default_security_group_id }
output "route_table_ids" { value = module.exapmle_vpc.route_table_ids }
output "selected_azs" { value = module.exapmle_vpc.selected_azs }

output "credentials_id" { value = module.example_cred.credentials_id }

output "uc_metastore_id" { value = module.example_ucms.uc_metastore_id }