##############################################################################################################
# - NOT CHANGE - 
# (This variables can remain by default - imported from T1)
##############################################################################################################

// Import data from deployment T1_day0_deploy-vpc
data "terraform_remote_state" "T1_day0_deploy-vpc" {
  backend = "local"
  config  = {
    path = "../T1_day0_deploy-vpc/terraform.tfstate"
  }
}

// Imported Tags
variable "tags" {
   default = null
}

// Imported Region
variable "region" {
   default = null
}

// Server Elastic Interface 
variable eni-server {
  default = null
}

// key-pair name
variable  key-pair_name {
  type        = string
  default     = null
}

variable account_id {
  type        = string
  default     = null
}      

variable externalid_token {
  type        = string
  default     = null
}  

// Access and secret keys to your environment
variable "access_key" {
  type        = string
  default     = null
}

variable "secret_key" {
  type        = string
  default     = null
}