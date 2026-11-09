variable "subscription_id" {
  type = string
}

variable "location" {
  type    = string
  default = "brazilsouth"
}

variable "vm_size" {
  type    = string
  default = "Standard_B1ms"
}

variable "admin_cidr" {
  type        = string
  description = "IP do administrador em CIDR (ex.: 203.0.113.7/32). Nunca 0.0.0.0/0."
  validation {
    condition     = var.admin_cidr != "0.0.0.0/0" && var.admin_cidr != "*"
    error_message = "A porta admin nao pode ficar aberta para o mundo."
  }
}

variable "ssh_public_key" {
  type = string
}

variable "repo_url" {
  type = string
}
