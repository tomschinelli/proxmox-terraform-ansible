# terraform {
#   required_providers {
#     proxmox = {
#       source  = "telmate/proxmox"
#       version = ">= 2.9.14"
#     }
#   }
# }
# #
# variable "proxmox_api_url" {
#   type = string
# }
# variable "proxmox_api_token_id" {
#   type      = string
#   sensitive = true
# }
# variable "proxmox_api_token_secret" {
#   type      = string
#   sensitive = true
# }
# provider "proxmox" {
#   pm_api_url          = var.proxmox_api_url
#   pm_api_token_id     = var.proxmox_api_token_id
#   pm_api_token_secret = var.proxmox_api_token_secret
#
#   pm_tls_insecure = true
# }
#


terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = ">= 0.60.1"
    }
  }
}

variable "proxmox_endpoint" {}
variable "proxmox_api_token" {}

provider "proxmox" {
  endpoint  = var.proxmox_endpoint
  api_token = var.proxmox_api_token
  insecure  = true
  ssh {
    agent    = false
    username = "root"
    private_key = file("~/.ssh/id_rsa")
  }
}