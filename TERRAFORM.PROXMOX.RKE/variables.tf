variable "dnsserver" {
  type = string
}

variable "sshkeys" {
  type = string
}

variable "vlan" {
  type = number
}

variable "bridge" {
  type = string
}

variable "appname" {
  type = string
}

variable "searchdomain" {
  type = string
}

variable "pm_api_url" {
  type = string
}

variable "pm_api_token_id" {
  type = string
}

variable "pm_api_token_secret" {
  type = string
}

variable "master" {
  description = "Defaults of master nodes in K3S"
  type = object({
    count    = number
    template = string
    cores = number
    memory = number
    node     = list(string)
    ip       = list(number)
  })
}

