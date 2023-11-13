terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  cloud {
    organization = "terraform-bootcamp-22"
    workspaces {
      name = "terra-house-22"
    }
  }
}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token = var.terratowns_access_token
}
module "home_terraform1_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.terraform1.public_path
  content_version = var.terraform1.content_version
}

resource "terratowns_home" "home_terraform1" {
  name = "Seal Team"
  description = <<DESCRIPTION
  SEAL Team is a military drama.
  DESCRIPTION
  domain_name = module.home_terraform1_hosting.domain_name
  # domain_name = "3fdq3gz.cloudfront.net"
  town = "video-valley"
  content_version = var.terraform1.content_version
}

module "home_terraform2_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.terraform2.public_path
  content_version = var.terraform2.content_version
}

resource "terratowns_home" "home_terraform2" {
  name = "Forza Motorsport"
  description = <<DESCRIPTION
  A race to the end.
  DESCRIPTION
  domain_name = module.home_terraform2_hosting.domain_name
  # domain_name = "3fdq3gz.cloudfront.net"
  town = "gamers-grotto"
  content_version = var.terraform2.content_version
}