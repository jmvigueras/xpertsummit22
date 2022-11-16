##############################################################################################################
# IMPORTANT - Update variables with output T3 and FGT VPC Golden details
##############################################################################################################

// Details about central HUB
variable "vpc-hub" {
  type = map(any)
  default = {
    "bgp_asn"    = "65001"         // BGP ASN HUB central (golden VPC)
    "advpn_pip"  = "<hub_fgt_pip>" // Update with public IP Golden HUB
    "advpn_net"  = "10.10.20.0/24" // Internal CIDR range for ADVPN tunnels private
    "sla_hck_ip" = "10.10.40.10"   // (FUTURE USE) Not necessary in this lab
  }
}