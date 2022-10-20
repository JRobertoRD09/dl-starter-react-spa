terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.74.0"
    }
  }
}

provider "aws" {
  profile = var.profile
  alias   = "use1"
  region  = "us-east-1"
}

provider "aws" {
  profile = var.profile
  region  = "us-east-2"
}

provider "aws" {
  profile = var.profile
  alias   = "usw2"
  region  = "us-west-2"
}

provider "aws" {
  profile = var.profile
  alias   = "euw1"
  region  = "eu-west-1"
}

provider "aws" {
  profile = var.profile
  alias   = "apse2"
  region  = "ap-southeast-2"
}