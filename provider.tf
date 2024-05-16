terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "bb-ordering-system-prod"
    key    = "bluesburguer/database.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}
