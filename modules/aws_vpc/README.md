# Module: `aws_vpc`

## Components covered by `aws_vpc`

* vpc (2 AZs)
* public subnet with natgw per vpc(namely, one natgw)
* private subnet with STS endpoint per AZs
* S3 endpoint(gw)
* internet gw
* security group
* routing table

## Usage

### variables

variables and example

```
cidr                            = "10.99.0.0/16"
private_subnets_for_endpoints   = ["10.99.254.0/24", "10.99.253.0/24"]
public_subnets_for_natgw_per_az = ["10.99.252.0/24", "10.99.251.0/24"]
prefix                          = "ktmr1234"
aws_region                      = "ap-northeast-1"
```

### outputs

outputs and example

```
default_route_table_id = "rtb-0bcf33ff810a7b25f"
default_security_group_id = "sg-04d27aa909e638d55"
route_table_ids = [
  "rtb-0be053183dc153143",
  "rtb-033c8e65249e65a13",
]
selected_azs = tolist([
  "ap-northeast-1a",
  "ap-northeast-1c",
])
vpc_id = "vpc-0c41d05733c29d824"
```

### examples

#### module use

```
module "your_vpc" {
    source = "../../modules/aws_vpc"

    cidr                            = "10.99.0.0/16"
    private_subnets_for_endpoints   = ["10.99.254.0/24", "10.99.253.0/24"]
    public_subnets_for_natgw_per_az = ["10.99.252.0/24", "10.99.251.0/24"]
    prefix                          = "ktmr1234"
    aws_region                      = "ap-northeast-1"
    }
```


#### standalone use



