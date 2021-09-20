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

# Cloud9
resource "aws_cloudformation_stack" "cloud9" {
    count = var.cloud9_count
    
    name = "${var.name}-${count.index}"

    template_body = templatefile(
        "/workspaces/terraform-interview/cloud9-stack.json",
        {
            resource_name = "apginterview"
            name = "${var.name}-${count.index}"
            count = count.index
            subnet_id = module.network.public_subnet_ids[0][0]
            owner_arn = var.owner_arn
        }
    )
}

