#########################################################################
# - NOT CHANGE - 
# 1. Configure BGP
#########################################################################
// Configure spoke BGP
resource "fortios_router_bgp" "bgp" {
    as                              = local.local_bgp_asn
    client_to_client_reflection     = "enable"
    keepalive_timer                 = "10"
    log_neighbour_changes           = "enable"
    graceful_restart_time           = "120"
    holdtime_timer                  = "3"

    neighbor {
        ip          = local.hub_advpn_i-ip
        remote_as   = var.vpc-golden_hub["bgp_asn"]
    }
    network {
        prefix  =  "${cidrhost(local.vpc-spoke_cidr,0)} ${cidrnetmask(local.vpc-spoke_cidr)}"
    }
}


