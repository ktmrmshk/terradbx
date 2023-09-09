variable "aws_region" { default = "ap-northeast-1" }
//variable "prefix" { default = "ktmr" }

variable "vpc_id" {}
variable "cidrs" {}
variable "azs" {}
variable "route_tables" {}



locals {
  subnets = {
    for i, val in var.azs :
    val => {
      "az"          = var.azs[i]
      "cidr"        = var.cidrs[i]
      "route_table" = var.route_tables[i]
    }
  }

}

//output "debug" { value = local.subnets }