terraform {
  backend "http" {}
  required_providers {
    proxmox = {
      source  = "TheGameProfi/proxmox"
      version = "2.9.15"
    }
  }
}

provider "proxmox" {
  pm_parallel         = 3
  pm_tls_insecure     = false
  pm_api_url          = var.pm_api_url
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
  pm_debug            = false
}
