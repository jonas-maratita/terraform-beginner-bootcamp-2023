terraform {
  #cloud {
    #organization = "terraform-bootcamp-22"
    #workspaces {
      #name = "terra-house-22"
    #}
  #}
}

module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}