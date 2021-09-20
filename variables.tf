variable "name" {
    type = string
    default = "cloud9-training-env-terraform"
}

variable "azs" {
    default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "member_count" {
    type = number
    description = "The number of accounts to be created"
}

variable "cloud9_count" {
    type = number
    description = "The number of cloud9 environemnts to be created"
}

variable "owner_arn" {
    type = string
}
