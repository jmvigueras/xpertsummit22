##############################################################################################################
# - NOT CHANGE - 
# (This variables can remain by default - imported from T1)
##############################################################################################################

// Import data from deployment T1_day0_deploy-vpc
data "terraform_remote_state" "T1_day0_deploy-vpc" {
  backend = "local"
  config  = {
    path = "../T1_day0_deploy-vpc/terraform.tfstate"
  }
}

// Imported Tags
variable "tags" {
   default = data.terraform_remote_state.T1_day0_deploy-vpc.tags
}

// Imported Region
variable "region" {
   default = data.terraform_remote_state.T1_day0_deploy-vpc.region
}

// Copy output values from terraform output in T1
variable eni-fgt_ids {
    default = data.terraform_remote_state.T1_day0_deploy-vpc.outpus.eni-fgt_ids
}

// Copy output values from terraform output in T1
variable eni-fgt_ips {
    default = data.terraform_remote_state.T1_day0_deploy-vpc.outpus.eni-fgt_ips
}

// Copy output values from terraform output in T1
variable vpc-sec_subnet-cidrs {
    default = data.terraform_remote_state.T1_day0_deploy-vpc.outpus.vpc-sec_subnet-cidrs
}

// CIDR range Golden VPC
variable "vpc-golden_cidr" {
  default = data.terraform_remote_state.T1_day0_deploy-vpc.outpus.vpc-golden_cidr
}

##############################################################################################################
# This variables can remain by default

variable "admin_cidr" {
  default = "0.0.0.0/0"
}

variable "admin_port" {
  default = "8443"
}

# Access and secret keys to your environment
variable "access_key" {}
variable "secret_key" {}