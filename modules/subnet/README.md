# Module: `subnet`

## Components covered by `subnet`

* one private subnet per az
* route table association

## Usage

### variables

variables and examples

```
aws_region = "ap-northeast-1"
prefix     = "ktmr123121"

vpc_id = "vpc-0c41d05733c29d824"
cidrs  = ["10.99.100.0/24", "10.99.101.0/24"]
azs = [
  "ap-northeast-1a",
  "ap-northeast-1c",
]
route_tables = [
  "rtb-0be053183dc153143",
  "rtb-033c8e65249e65a13",
]
```

### outputs

outputs and example

```
subnet_ids = [
  "subnet-0dd162b0b5364b4f5",
  "subnet-0b591548a9f3cb764",
]
```

### examples

#### module use

```
module "cluster_subnets" {
  source = "../../modules/subnet"

  prefix     = "ktmr_mod2"
  aws_region = var.aws_region
  vpc_id     = "vpc-0c41d05733c29d824"
  cidrs      = ["10.99.102.0/24", "10.99.103.0/24"]
  azs = [
    "ap-northeast-1a",
    "ap-northeast-1c",
  ]
  route_tables = [
    "rtb-0be053183dc153143",
    "rtb-033c8e65249e65a13",
  ]
}
```


#### standalone use



