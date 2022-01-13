terraform {
  required_version = ">=1.0"
  required_providers {
    mackerel = {
      source  = "mackerelio-labs/mackerel"
      version = "~> 0.0.8"
    }
  }
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "my-org"
    workspaces {
      name = "mackerel-org-a"
    }
  }
}

data "terraform_remote_state" "aws" {
  backend = "remote"

  config = {
    organization = "my-org"
    workspaces = {
      name = "mackerel-aws"
    }
  }
}
