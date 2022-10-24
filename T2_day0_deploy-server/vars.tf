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
   default = data.terraform_remote_state.T1_day0_deploy-vpc.tags
}

// Imported Region
variable "region" {
   default = data.terraform_remote_state.T1_day0_deploy-vpc.region
}

// Server Elastic Interface 
variable eni-server {
  default = data.terraform_remote_state.T1_day0_deploy-vpc.eni-server
}

// key-pair name
variable  key-pair_name {
  type        = string
  default     = data.terraform_remote_state.T1_day0_deploy-vpc.key-pair_name
}

variable account_id {
  type        = string
  default     = data.terraform_remote_state.T1_day0_deploy-vpc.account_id
}      

variable externalid_token {
  type        = string
  default     = data.terraform_remote_state.T1_day0_deploy-vpc.externalid_token
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