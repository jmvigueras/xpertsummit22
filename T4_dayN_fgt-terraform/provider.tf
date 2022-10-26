##############################################################################################################
# Configure provider FortiOS
##############################################################################################################
terraform {
  required_providers {
    fortios = {
      source = "fortinetdev/fortios"
    }
  }
}
##############################################################################################################
# - NOT CHANGE - 
# Update variable tags in vars.tf and access_key & secret_key in terraform.tfvars
##############################################################################################################
provider "fortios" {
  hostname = "${local.spoke-fgt["pip"]}:${local.spoke-fgt["admin_port"]}"
  token    = local.spoke-fgt["api-token"]
  insecure = "true"
}