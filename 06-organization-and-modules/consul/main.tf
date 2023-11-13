terraform {
  # Assumes s3 bucket and dynamo DB table already set up
  # See /code/03-basics/aws-backend
  backend "s3" {
    bucket         = "devops-directive-tfstate-tutorial3"
    key            = "06-organization-and-modules/consul/terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "terraform-state-locking3"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.25.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

############################################################
##
## NOTE: if you are deploying this in your production setup
## follow the instructions in the github repo on how to modify
## deploying with the defaults here as an example of the power
## of modules.
##
## REPO: https://github.com/hashicorp/terraform-aws-consul
##
############################################################
module "consul-starter" {
  source  = "hashicorp/consul-starter/aws"
  version = "0.2.0"
  # insert the 5 required variables here
}