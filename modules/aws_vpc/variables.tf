variable "aws_region" { default = "ap-northeast-1" }
variable "prefix" { default = "ktmr" }

variable "cidr" { default = "10.99.0.0/16" }
variable "private_subnets_for_endpoints" { default = ["10.99.254.0/24", "10.99.253.0/24"] }


resource "random_string" "randfix" {
  special = false
  upper   = false
  length  = 8
}

locals {
  prefix = "${var.prefix}${random_string.randfix.result}"
}
