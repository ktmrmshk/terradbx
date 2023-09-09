output "subnet_ids" {
  value = [for val in aws_subnet.cluster_subnet : val.id]
}