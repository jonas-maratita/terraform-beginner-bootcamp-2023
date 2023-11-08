terraform {
  #cloud {
    #organization = "terraform-bootcamp-22"
    #workspaces {
      #name = "terra-house-22"
    #}
  #}
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.19.0"
    }
  }
}
provider "aws" {
  # Configuration options
}
provider "random" {
  # Configuration options
}