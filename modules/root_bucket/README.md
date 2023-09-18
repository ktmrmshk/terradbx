# Module: `root_bucket`

DBFS root bucket (S3)

## Components covered by `root_bucket`

* S3 bucket with policy
* storage resouce registration on databricks

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
storage_configuration_id = "abc123"
```

### examples

#### module use

```
module "your_root_bucket" {
    source = "../../modules/../root_bucket/"

    databricks_account_id       = "12345-67890-abcssa-asdfa"
    prefix                      = "ktmrtest123"
    }
```


#### standalone use

