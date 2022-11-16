##############################################################################################################
# - NOT CHANGE - terraform outputs
# (Prepared for importing in following trainings)
##############################################################################################################

output "eni-fgt_ids" {
  value = {
    "port1" = aws_network_interface.ni-fgt-port1.id
    "port2" = aws_network_interface.ni-fgt-port2.id
    "port3" = aws_network_interface.ni-fgt-port3.id
  }
}

output "eni-fgt_ips" {
  value = {
    "port1" = aws_network_interface.ni-fgt-port1.private_ip
    "port2" = aws_network_interface.ni-fgt-port2.private_ip
    "port3" = aws_network_interface.ni-fgt-port3.private_ip
  }
}

output "vpc-sec_subnet-cidrs" {
  value = {
    "public"  = aws_subnet.subnet-az1-public.cidr_block
    "private" = aws_subnet.subnet-az1-private.cidr_block
    "mgmt-ha" = aws_subnet.subnet-az1-mgmt-ha.cidr_block
    "servers" = aws_subnet.subnet-az1-servers.cidr_block
  }
}

output "eni-server" {
  value = {
    "id" = aws_network_interface.ni-server-port1.id
    "ip" = aws_network_interface.ni-server-port1.private_ip
  }
}

output "tags" {
  value = var.tags
}

output "region" {
  value = var.region
}

output "key-pair_name" {
  value = aws_key_pair.user-kp[0].key_name
}

output "vpc-hub_cidr" {
  value = var.vpc-hub_cidr
}

output "vpc-spoke_cidr" {
  value = var.vpc-spoke_cidr
}

output "externalid_token" {
  sensitive = true
  value     = var.externalid_token
}

output "account_id" {
  sensitive = true
  value     = var.account_id
}

output "access_key" {
  sensitive = true
  value     = var.access_key
}

output "secret_key" {
  sensitive = true
  value     = var.secret_key
}

output "rsa-public-key" {
  sensitive = true
  value     = var.key-pair_rsa-public-key
}