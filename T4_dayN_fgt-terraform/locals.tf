##############################################################################################################
# - NOT CHANGE - 
# (This variables can remain by default - imported from T1,T2 and T3)
##############################################################################################################
// Import data from deployment T1_day0_deploy-vpc
data "terraform_remote_state" "T1_day0_deploy-vpc" {
  backend = "local"
  config  = {
    path = "../T1_day0_deploy-vpc/terraform.tfstate"
  }
}
// Import data from deployment T3_day0_deploy-server
data "terraform_remote_state" "T3_day0_deploy-fgt" {
  backend = "local"
  config  = {
    path = "../T3_day0_deploy-fgt/terraform.tfstate"
  }
}
// Define local variables
locals {
  // Create local user variable for reference ipsec interface IP 
  // ej. eu-west-1-user1 will have -> 10.10.20.11)
  // ej. eu-west-3-user2 will have -> 10.10.20.32)
  local_advpn_ip = cidrhost(var.vpc-golden_hub["advpn_net"],split("-","${local.tags["Owner"]}")[5]+(10*split("-","${local.region["region"]}")[2]))
  hub_advpn_i-ip = cidrhost(var.vpc-golden_hub["advpn_net"],254)
  // Asigned ASN for spokes (don't change)
  local_bgp_asn  = "65011"
  // Imported FGT spoke data
  spoke-fgt = data.terraform_remote_state.T3_day0_deploy-fgt.outputs.spoke-fgt
  // Imported spoke range
  vpc-spoke_cidr = data.terraform_remote_state.T1_day0_deploy-vpc.outputs.vpc-spoke_cidr
  // Imported ACCESS and SECRET KEY
  access_key = data.terraform_remote_state.T1_day0_deploy-vpc.outputs.access_key
  secret_key = data.terraform_remote_state.T1_day0_deploy-vpc.outputs.secret_key
  // Imported Tags
  tags = data.terraform_remote_state.T1_day0_deploy-vpc.outputs.tags
  // Imported Region
  region = data.terraform_remote_state.T1_day0_deploy-vpc.outputs.region
  // CIDR range Golden VPC
  vpc-golden_cidr = data.terraform_remote_state.T1_day0_deploy-vpc.outputs.vpc-golden_cidr
   // External token name -> (USED AS ADVPN PSK)
  externalid_token = data.terraform_remote_state.T1_day0_deploy-vpc.outputs.externalid_token
}


