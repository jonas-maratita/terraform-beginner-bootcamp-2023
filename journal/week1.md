# Terraform Beginner Bootcamp 2023 - Week 1

## Fixing Tags

[How to Delete Local and Remote tags on Git](https://devconnected.com/how-to-delete-local-and-remote-tags-on-git/)

Locally delete a tag
```sh
git tag -d <tag_name>
```

Remotely delete tag
```sh
git push --delete origin tagname
```

Checkout the commit that you want to retag. Grab the SHA from your Github history
```
git checkout <SHA>
git tag M.M.P
git push --tags
git checkout main
```

## Root Module Structure

Our Root Module Structure is as follows:

```
PROJECT_ROOT
│
├── main.tf          # everything else
├── variables.tf     # stores the structure of input variables
├── providers.tf     # defines required providers and their configuration
├── outputs.tf       # stores our outputs
├── terraform.tfvars # the data of variables we want to load into our Terraform project
└── README.md        # required for root modules
```
 
[Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)

## Terraform and Input Variables 
### Terraform Cloud Variables

In Terraform we can set two kinds of variables:
- Environment Variables - set in bash terminal. e.g., AWS Credentials
- Terraform Variables - normally set in tfvars file

Terraform Cloud variables can be set to sensitive so they are not shown in the UI

### Loading Terraform Input Variables

[Terraform Input Variables](https://developer.hashicorp.com/terraform/language/values/variables)

### var flag
The `-var` flag can be used to set an input variable or override a varriable in the tfvars file e.g., `terraform -var user_uuid="my-user-id"`

### var-file flag

- To Do: document this flag

### terraform.tfvars

This is the default file to load terraform files in bulk


### auto.tfvars

- To Do: document this functionality for terraform cloud

### Order of Terraform variables

-  To Do: document which terraform variables takes precedence

## Dealing with Configuration Drift

## What happens if we lose our state file?

If you lose your statefile, you most likely have to tear down all your cloud infrastructure manually.

You can use Terraform import but it won't work with all cloud resources. Check the Terraform Cloud providers documentation for which resources support import.

### Fix Missing Resources with Terraform Import

`terraform import aws_s3_bucket.bucket bucket-name`

[Terraform Import](https://developer.hashicorp.com/terraform/cli/import)

[AWS S3 Bucket Import](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#import)

### Fix Manual Configuration

If someone deletes or modifies cloud manually through ClickOps

If we run Terraform plan it will attempt to put our infrastructure back into the expected state fixing configuration drift.

## Fix using Terraform Refresh

```sh
terraform apply -refresh-only -auto-approve
```

## Terraform Modules

### Terraform Module Structure

It is recommended in a `modules` directory when locally developling modules but can be named whatever you like.

### Passing Input Variables

We can pass input variables to our moudle.
The module has to declare the terraform variables in its own variables.tf

```tf
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}
```

### Modules Sources

We can import the modules from various places using the source e.g.:
- Locally
- Github
- Terraform Registry

```tf
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
}
```
[Modules Sources](https://developer.hashicorp.com/terraform/language/modules/sources)

## Considerations when using ChatGPT to write Terraform

LLMs such as ChatGPT may not be trained on the latest documentation or information about Terraform.

It may likely produce older examples that could be deprecated. Often affecting providers

## Working wwith files in Terraform

### Fileexists function

[Fileexists Function](https://developer.hashicorp.com/terraform/language/functions/fileexists)

This is a built-in Terraform function to check if a file exists

```tf
condition = fileexists(var.index_html_filepath)
```

### Filemd5

[Filemd5 Function](https://developer.hashicorp.com/terraform/language/functions/filemd5)

### Path Variables

In Terraform there is a special variable called `path` that allows us to reference local paths:
-path.module = get the path for the current module
-path.root = get the path for the root module
[Special Path Variable](https://developer.hashicorp.com/terraform/language/expressions/references#filesystem-and-workspace-info)

```
resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "index.html"
  source = "${path.root}public/index.html"
}
```

## Terraform Locals

Locals allow us to define local variables.
It can be useful when we need to transform data into another format and have referenced variables.

The code listed below is found in resource-cdn.tf
```tf
locals {
    s3_origin_id = "MYS3Origin"
}```

[Local Values](https://developer.hashicorp.com/terraform/language/values/locals)
### Terraform Data Sources

This allows us to source date from cloud resources.

This is usefule when we want to reference cloud resources without importing them.

```tf
data "aws_caller_identity" "current" {}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}
```

[Data Sources](https://developer.hashicorp.com/terraform/language/data-sources)

## Working with JSON

We use the jsonencode to create the json policy inline in the HCL.
```tf
jsonencode({"hello"="world"})
{"hello":"world"}
```

[jsonencode](https://developer.hashicorp.com/terraform/language/functions/jsonencode)


