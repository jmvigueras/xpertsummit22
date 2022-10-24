##############################################################################################################
# Terraform state
##############################################################################################################
terraform {
  required_version = ">= 1.0"
}

##############################################################################################################
# - NOT CHANGE - 
# Update variable tags in vars.tf and access_key & secret_key in terraform.tfvars
##############################################################################################################
provider "aws" {
  region     = var.region["region"]
  access_key = var.access_key
  secret_key = var.secret_key
  assume_role {
    role_arn     = "arn:aws:iam::${var.account_id}:role/role-${var.tags["Owner"]}"
    external_id  = var.externalid_token
  }
}
