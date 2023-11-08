terraform {
  #cloud {
    #organization = "terraform-bootcamp-22"
    #workspaces {
      #name = "terra-house-22"
    #}
  #}
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
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