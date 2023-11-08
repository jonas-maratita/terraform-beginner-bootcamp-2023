# Terraform Beginner Bootcamp 2023 - Week 1

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