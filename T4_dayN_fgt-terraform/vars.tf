##############################################################################################################
# IMPORTANT - Update variables with output T3 and FGT VPC Golden details
##############################################################################################################

// Details about central HUB (golden VPC)
variable "vpc-golden_hub" {
  type = map(any)
  default = {
    "bgp_asn"        = "65001"         // BGP ASN HUB central (golden VPC)
    "advpn_pip"      = "11.11.11.11"   // Update with public IP Golden HUB
    "advpn_net"      = "10.10.20.0/24" // Internal CIDR range for ADVPN tunnels private
    "sla_hck_ip"     = "10.10.40.10"   // (FUTURE USE) Not necessary in this lab
  }
}





##############################################################################################################
# This variables can remain by default

// Create local user variable for reference ipsec interface IP 
// ej. eu-west-1-user1 will have -> 10.10.20.11)
// ej. eu-west-3-user2 will have -> 10.10.20.32)
locals {
  local_advpn_ip = cidrhost(var.vpc-golden_hub["advpn_net"],split("-","${var.tags["Owner"]}")[5]+(10*split("-","${var.region["region"]}")[2]))
  local_bgp_asn  = "65011"
  hub_advpn_i-ip = cidrhost(var.vpc-golden_hub["advpn_net"],254)
}

// Import data from deployment T1_day0_deploy-vpc
data "terraform_remote_state" "T1_day0_deploy-vpc" {
  backend = "local"
  config  = {
    path = "../T1_day0_deploy-vpc/terraform.tfstate"
  }
}

// Import data from deployment T2_day0_deploy-server
data "terraform_remote_state" "T2_day0_deploy-server" {
  backend = "local"
  config  = {
    path = "../T2_day0_deploy-server/terraform.tfstate"
  }
}

// Import data from deployment T3_day0_deploy-server
data "terraform_remote_state" "T3_day0_deploy-fgt" {
  backend = "local"
  config  = {
    path = "../T3_day0_deploy-fgt/terraform.tfstate"
  }
}

// FortiGate details deployed in T3
variable "spoke-fgt" {
  default = data.terraform_remote_state.T3_day0_deploy-fgt.spoke-fgt
}

// CIDR range to use for your VCP: 10.1.x.x group 1 - 10.1.1.0/24 user-1
variable "vpc-spoke_cidr"{
  default = data.terraform_remote_state.T1_day0_deploy-vpc.vpc-spoke_cidr
}

// Imported Tags
variable "tags" {
   default = data.terraform_remote_state.T1_day0_deploy-vpc.tags
}

// Imported Region
variable "region" {
   default = data.terraform_remote_state.T1_day0_deploy-vpc.region
}




