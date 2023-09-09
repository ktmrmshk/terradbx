resource "aws_subnet" "cluster_subnet" {
  for_each = local.subnets

  availability_zone = each.value.az
  cidr_block        = each.value.cidr
  vpc_id            = var.vpc_id
}

resource "aws_route_table_association" "cluster_subnet_route" {
  for_each = local.subnets

  subnet_id      = aws_subnet.cluster_subnet[each.key].id
  route_table_id = each.value.route_table
}

