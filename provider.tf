terraform {
  backend "s3" {
    bucket = "terraform-fiap"
    key    = "bluesburguer/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  profile = "default"
  region  = var.regionDefault

  default_tags {
    tags = var.tags
  }
}