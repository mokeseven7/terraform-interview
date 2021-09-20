# TODO: make profile to custom variable
terraform {
    required_version = ">= 0.12.0"

    # When initialization, this block should be commented out.
    // backend "s3" {
    //     bucket = var.s3_bucket_name
    //     key = "terraform.tfstate"
    //     region = "us-east-1"
    //     shared_credentials_file = "~/.aws/credentials"
    //     profile = "admin-cli"
    // }
}

provider "aws" {
    region = "us-east-1"
    shared_credentials_file = "~/.aws/credentials"
    profile = "zeroc.rej.i"
}


data "aws_region" "current" {}



module "network" {
    source = "./network"
    name = var.name
    azs = var.azs
}

module "user" {
    source = "./user"
    user_count = var.member_count
    name = var.name
}

resource "aws_cloud9_environment_ec2" "environment" {
  count                       = var.count
  name                        = var.name
  instance_type               = var.instance_type
  automatic_stop_time_minutes = var.automatic_stop_time_minutes
  description                 = var.description
  owner_arn                   = var.owner_arn
  subnet_id                   = var.subnet_id
  tags = merge(
    {
      "NameCount" = var.enviroment_count > 1 || var.use_num_suffix ? format("%s-%d", var.name, 
        count.index + 1) : var.name
    },
    var.tags,
  )
}


