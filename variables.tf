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
variable "create_environment" {
    description = "Create or not the defined resource. Defaults to false"
    type        = bool
    default     = false
}



variable "enviroment_count" {
    description = "The number of enviroment to create"
    type        = number
    default     = 0
}

variable "use_num_suffix" {
  description = "Always append numerical suffix to instance name, even if instance_count is 1"
  type        = bool
  default     = true
}

variable "instance_type" {
    description = "The type of the EC2 instance to connect to the environment, e.g t2.micro"
    type        = string
    default     = ""
}

variable "automatic_stop_time_minutes" {
    description = "Minutes of min to wait until shut down the instance since has last been used"
    type        = number
    default     = 30
}

variable "description" {
    description = "The description of the environment"
    type        = string
    default     = ""
}



variable "subnet_id" {
    description = "The ID of the subnet in Amazon VPC that AWS Cloud9 will use to communicate with the Amazon EC2 instance"
    type        = string
    default     = ""
}

variable "subnet_az" {
    description = "The AZ of the subnet in Amazon VPC that AWS Cloud9 will use to communicate with the Amazon EC2 instance"
    type        = string
    default     = ""
}

variable "tags" {
    description = "Key-value map of resocurce tag"
    type        = map(string)
    default     = {}
}