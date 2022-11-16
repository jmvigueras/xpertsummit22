##############################################################################################################
# Create FGT ACTIVE VM
##############################################################################################################

// Create and attach the Elastic Public IPs to interface public interface
resource "aws_eip" "eip-fgt_public" {
  vpc               = true
  network_interface = local.eni-fgt_ids["port2"]
  tags              = local.tags
}

// Create and attach the Elastic Public IPs to interface management interface
resource "aws_eip" "eip-fgt_mgmt" {
  vpc               = true
  network_interface = local.eni-fgt_ids["port1"]
  tags              = local.tags
}

// Create the instance Fortigate in AZ1
resource "aws_instance" "fgt" {
  ami                  = data.aws_ami_ids.fgt-ond-amis.ids[0]
  instance_type        = "c5.xlarge"
  availability_zone    = local.region["region_az1"]
  key_name             = local.key-pair_name
  iam_instance_profile = aws_iam_instance_profile.fgt-sdn_profile.name
  user_data            = data.template_file.fgt.rendered
  network_interface {
    device_index         = 0
    network_interface_id = local.eni-fgt_ids["port1"]
  }
  network_interface {
    device_index         = 1
    network_interface_id = local.eni-fgt_ids["port2"]
  }
  network_interface {
    device_index         = 2
    network_interface_id = local.eni-fgt_ids["port3"]
  }
  tags = local.tags
}

// Create user-data Fortigate in AZ1
data "template_file" "fgt" {
  template = file("./templates/fgt.conf")

  vars = {
    fgt_id     = "${local.tags["Name"]}-fgt"
    admin_port = var.admin_port
    admin_cidr = var.admin_cidr

    port1_ip   = local.eni-fgt_ips["port1"]
    port1_mask = cidrnetmask(local.vpc-sec_subnet-cidrs["mgmt-ha"])
    port1_gw   = cidrhost(local.vpc-sec_subnet-cidrs["mgmt-ha"], 1)
    port2_ip   = local.eni-fgt_ips["port2"]
    port2_mask = cidrnetmask(local.vpc-sec_subnet-cidrs["public"])
    port2_gw   = cidrhost(local.vpc-sec_subnet-cidrs["public"], 1)
    port3_ip   = local.eni-fgt_ips["port3"]
    port3_mask = cidrnetmask(local.vpc-sec_subnet-cidrs["private"])
    port3_gw   = cidrhost(local.vpc-sec_subnet-cidrs["private"], 1)

    api_key        = random_string.api_key.result
    rsa-public-key = local.rsa-public-key
  }
}

# Create new random API key to be provisioned in FortiGates.
resource "random_string" "api_key" {
  length  = 30
  special = false
  numeric = true
}

# Get the last AMI Images from AWS MarektPlace FGT on-demand
data "aws_ami_ids" "fgt-ond-amis" {
  owners = ["679593333241"]

  filter {
    name   = "name"
    values = ["FortiGate-VM64-AWSONDEMAND*"]
  }
}