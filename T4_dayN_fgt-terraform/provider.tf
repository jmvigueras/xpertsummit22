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

// User Fortigate data
provider "fortios" {
  hostname = "${var.spoke-fgt["ip"]}:${var.spoke-fgt["admin_port"]}"
  token    = var.spoke-fgt["api-token"]
  insecure = "true"
}