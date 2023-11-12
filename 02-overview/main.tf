terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "example" {
  ami           = "ami-03caf91bb3d81b843" # Ubuntu 20.04 LTS // ap-southeast-1
  instance_type = "t2.micro"
}
