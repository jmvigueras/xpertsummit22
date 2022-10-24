#########################################################################
# - NOT CHANGE -  
# 1. Create firewall objet h-student-server
# 2. Create policy to allow HTTP traffic from Golden HUB server
#########################################################################

// Create new firewall address
resource "fortios_firewall_address" "h-student-server" {
  name                 = "h-student-server"
  type                 = "iprange"
  end_ip               = data.terraform_remote_state.T2_day0_deploy-server.outputs.server["ip"]
  start_ip             = data.terraform_remote_state.T2_day0_deploy-server.outputs.server["ip"]
  color                = "3" 
}

// Create new policy to allow traffic from golden server
resource "fortios_firewall_policy" "p-student-server" {
  action             = "accept"
  logtraffic         = "all"
  name               = "Allow HTTP traffic p-student-server"
  schedule           = "always"

  dstaddr {
    name = "h-student-server"
  }
  dstintf {
    name = "port3"
  }
  service {
    name = "HTTP"
  }
  srcaddr {
    name = "all"
  }
  srcintf {
    name = "advpn-public"
  }
}

