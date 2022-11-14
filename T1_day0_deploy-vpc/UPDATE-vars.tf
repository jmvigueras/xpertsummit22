##############################################################################################################
# - IMPORTANT - 
# - UPDATE - fix variables with you group member and user
##############################################################################################################

// IMPORTANT: UPDATE Owner with your AWS IAM user name
variable "tags" {
  description = "Attribute for tag Enviroment"
  type = map(any)
  default     = {
    Owner   = "xs22-eu-west-1-user-10"   //update with your assigned user for access AWS console
    Name    = "user-10"                  //update with your assigned user name
    Project = "xs22"                    
  }
}

// Region and Availability Zone where deploy VPC and Subnets
variable "region" {
  type = map(any)
  default = {
    "region"     = "eu-west-1"   //update with your assigned region
    "region_az1" = "eu-west-1a"  //update with your assigned AZ
  }
}

// CIDR range to use for your VCP: 10.1.x.x group 1 - 10.1.1.0/24 user-1
variable "vpc-spoke_cidr"{
  type    = string
  default = "10.1.10.0/24"     //update with your assigned cidr
}


##############################################################################################################
# This variables can remain by default

// Principal account in AWS 
variable "account_id" {
  description = "AWS account ID"
  type        = string
  default     = null
}

// ExternalID Token for allow STS get token
variable "externalid_token" {
  description = "ExternalId token for assume role"
  type        = string
  default     = null
}

variable "admin_cidr" {
  default = "0.0.0.0/0"
}

variable "admin_port" {
  default = "8443"
}

// CIDR range Golden VPC
variable "vpc-golden_cidr" {
  default = "10.10.10.0/24"
}

# Access and secret keys to your environment
variable "access_key" {}
variable "secret_key" {}

// SSH RSA public key for KeyPair if not exists
variable key-pair_rsa-public-key {
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDFWseRdS/YTmE0cPqHezW/YtSRjRdz/jXgY4ChaUby++nGRZzn444htTCcMwxnUP63otTR3wBIwhpgckphQaA2CG6Bkp4KeRfbJ3WXoTpQxAC90VqqzPDh8hixLVbMpB9zf5Ox9EGzokZ1UZY8NKPsYMNiS8Q2iXRB5RZRckzEdYft6scl3wQ7cw2um0d9eFW8yJB4YELeQwhWBNbt8RE8H7MPbIHve9TBtzgrWH+1xdRmaQQa32fzC0RcubLUoG0PZzJMJvRHZLZ+WoASOwx6jNY/Uii1NYzjq5BLExCsUKzqTvl8aagNOD73u79cQbomRng87c8rzXMAfYZ4QMmNuBRFqQMa9kLs+FbPePSgYMcJS6OSXHjEby7CsnHpnFsCdApTv2gXexRdbOJsyaxe459rvvYCb0VcHbF8OY1+h5VknKh3HoxWah0b08i3k3G8O12lDxpGqHfejIT21ybqOBps9OBvNU/qAAH2qB3jhrLxDpHKAk62GiqR7Oltjfs= Random RSA key"
}

// Key-pair name
variable key-pair_name {
  type        = string
  default     = null
}