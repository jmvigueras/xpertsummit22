##############################################################################################################
# Create FGT ACTIVE VM
##############################################################################################################

// Create and attach the Elastic Public IPs to interface public interface
resource "aws_eip" "eip-fgt_public" {
  vpc               = true
  network_interface = var.eni-fgt_ids["port2"]
  tags = var.tags
}

// Create and attach the Elastic Public IPs to interface management interface
resource "aws_eip" "eip-fgt_mgmt" {
  vpc               = true
  network_interface = var.eni-fgt_ids["port1"]
  tags = var.tags
}

// Create the instance Fortigate in AZ1
resource "aws_instance" "fgt" {
  ami                  = data.aws_ami_ids.fgt-ond-amis.ids[1]
  instance_type        = "c5.xlarge"
  availability_zone    = var.region["region_az1"]
  key_name             = aws_key_pair.user-xs22-kp.key_name
  iam_instance_profile = aws_iam_instance_profile.fgt-sdn_profile.name
  user_data            = data.template_file.fgt.rendered
  network_interface {
    device_index         = 0
    network_interface_id = var.eni-fgt_ids["port1"]
  }
  network_interface {
    device_index         = 1
    network_interface_id = var.eni-fgt_ids["port2"]
  }
  network_interface {
    device_index         = 2
    network_interface_id = var.eni-fgt_ids["port3"]
  }
  tags = var.tags
}

// Create user-data Fortigate in AZ1
data "template_file" "fgt" {
  template = file("./templates/fgt.conf")

  vars = {
    fgt_id               = "${var.tags["Name"]}-fgt"
    admin_port           = var.admin_port
    admin_cidr           = var.admin_cidr

    port1_ip             = var.eni-fgt_ips["port1"]
    port1_mask           = cidrnetmask(var.vpc-sec_subnet-cidrs["mgmt-ha"])
    port1_gw             = cidrhost(var.vpc-sec_subnet-cidrs["mgmt-ha"],1)
    port2_ip             = var.eni-fgt_ips["port2"]
    port2_mask           = cidrnetmask(var.vpc-sec_subnet-cidrs["public"])
    port2_gw             = cidrhost(var.vpc-sec_subnet-cidrs["public"],1)
    port3_ip             = var.eni-fgt_ips["port3"]
    port3_mask           = cidrnetmask(var.vpc-sec_subnet-cidrs["private"])
    port3_gw             = cidrhost(var.vpc-sec_subnet-cidrs["private"],1)

    api_key              = random_string.api_key.result
   
    /*
    hub_advpn_psk        = var.externalid_token
    hub_bgp_asn          = var.vpc-golden_hub["bgp_asn"]
    hub_advpn_e-ip1      = var.vpc-golden_hub["advpn_pip"]
    hub_advpn_i-ip1      = cidrhost(var.vpc-golden_hub["advpn_net"],254)
    hub_cidr             = var.vpc-golden_cidr
    sla_hck_ip1          = var.vpc-golden_hub["sla_hck_ip"]

    local_bgp_asn        = "65010"
    local_advpn_id       = split("-","${var.tags["Name"]}")[1]
    local_advpn_i-ip1    = cidrhost(var.vpc-golden_hub["advpn_net"],split("-","${var.tags["Name"]}")[1]+(10*split("-","${var.region["region"]}")[2]))
    local_servers_cidr   = var.vpc-sec_subnet-cidrs["servers"]
    */
  }
}

# Create new random API key to be provisioned in FortiGates.
resource "random_string" "api_key" {
  length                 = 30
  special                = false
  numeric                = true
}

# Get the last AMI Images from AWS MarektPlace FGT on-demand
data "aws_ami_ids" "fgt-ond-amis" {
  owners = ["679593333241"]

  filter {
    name   = "name"
    values = ["FortiGate-VM64-AWSONDEMAND*"]
  }
}