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
  region     = local.region["region"]
  access_key = local.access_key
  secret_key = local.secret_key
  assume_role {
    role_arn     = "arn:aws:iam::${local.account_id}:role/role-${local.tags["Owner"]}"
    external_id  = local.externalid_token
  }
}
