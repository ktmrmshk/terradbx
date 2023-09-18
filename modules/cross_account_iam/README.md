# Module: `cross_account_iam`


## Components covered by `cross_account_iam`

* Cross Account IAM role
* IAM policy attached the role
* Credential registration on Databricks Console 

## Usage

### variables

variables and example

```
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

    databricks_account_id       = "12345-67890-abcssa-asdfa"
    prefix                      = "ktmrtest123"
}
```


#### standalone use



