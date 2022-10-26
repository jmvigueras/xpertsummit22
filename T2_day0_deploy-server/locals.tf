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
// Defined imported variables in locals
locals {
  // Imported ACCESS and SECRET KEY
  access_key = data.terraform_remote_state.T1_day0_deploy-vpc.outputs.access_key
  secret_key = data.terraform_remote_state.T1_day0_deploy-vpc.outputs.secret_key
  // Imported Tags
  tags = data.terraform_remote_state.T1_day0_deploy-vpc.outputs.tags
  // Imported Region
  region = data.terraform_remote_state.T1_day0_deploy-vpc.outputs.region
  // Imported Server Elastic Interface 
  eni-server = data.terraform_remote_state.T1_day0_deploy-vpc.outputs.eni-server
  // Imported key-pair name
  key-pair_name = data.terraform_remote_state.T1_day0_deploy-vpc.outputs.key-pair_name
  // Imported accountid
  account_id = data.terraform_remote_state.T1_day0_deploy-vpc.outputs.account_id
  // Imported external token name
  externalid_token = data.terraform_remote_state.T1_day0_deploy-vpc.outputs.externalid_token
}