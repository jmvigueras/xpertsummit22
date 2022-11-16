##############################################################################################################
# - NOT CHANGE - 
# (This variables can remain by default - imported from T1)
##############################################################################################################
// Import data from deployment T1_day0_deploy-vpc
data "terraform_remote_state" "T1_day0_deploy-vpc" {
  backend = "local"
  config = {
    path = "../T1_day0_deploy-vpc/terraform.tfstate"
  }
}
// Imported value from terraform output in T1
locals {
  // Imported ACCESS and SECRET KEY
  access_key = data.terraform_remote_state.T1_day0_deploy-vpc.outputs.access_key
  secret_key = data.terraform_remote_state.T1_day0_deploy-vpc.outputs.secret_key
  // Imported Tags
  tags = data.terraform_remote_state.T1_day0_deploy-vpc.outputs.tags
  // Imported Region
  region = data.terraform_remote_state.T1_day0_deploy-vpc.outputs.region
  // key-pair name
  key-pair_name = data.terraform_remote_state.T1_day0_deploy-vpc.outputs.key-pair_name
  // accountid
  account_id = data.terraform_remote_state.T1_day0_deploy-vpc.outputs.account_id
  // External token name
  externalid_token = data.terraform_remote_state.T1_day0_deploy-vpc.outputs.externalid_token
  // FGT Elastic Interface 
  eni-fgt_ids = data.terraform_remote_state.T1_day0_deploy-vpc.outputs.eni-fgt_ids
  eni-fgt_ips = data.terraform_remote_state.T1_day0_deploy-vpc.outputs.eni-fgt_ips
  // FGT subnets
  vpc-sec_subnet-cidrs = data.terraform_remote_state.T1_day0_deploy-vpc.outputs.vpc-sec_subnet-cidrs
  // FGT subnets
  vpc-hub_cidr = data.terraform_remote_state.T1_day0_deploy-vpc.outputs.vpc-hub_cidr
  // RSA Keys
  rsa-public-key = data.terraform_remote_state.T1_day0_deploy-vpc.outputs.rsa-public-key
}


##############################################################################################################
# This variables can remain by default

variable "admin_cidr" {
  default = "0.0.0.0/0"
}

variable "admin_port" {
  default = "8443"
}
