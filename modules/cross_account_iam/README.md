# Module: `cross_account_iam`


## Components covered by `cross_account_iam`

* Cross Account IAM role
* IAM policy attached the role
* Credential registration on Databricks Console 

## Usage

### variables

variables and example

```
aws_region                  = "ap-northeast-1"
databricks_account_username = "your_admin@yourdomain.com"
databricks_account_password = "1234567890abcdefg"
databricks_account_id       = "12345-67890-abcssa-asdfa"
prefix                      = "ktmrtest123"
```

### outputs

outputs and example

```
credentials_id = "foobar123"
```

### examples

#### module use

```
module "your_vpc" {
    source = "../../modules/cross_account_iam"

    aws_region                  = "ap-northeast-1"
    databricks_account_username = "your_admin@yourdomain.com"
    databricks_account_password = "1234567890abcdefg"
    databricks_account_id       = "12345-67890-abcssa-asdfa"
    prefix                      = "ktmrtest123"
}
```


#### standalone use



