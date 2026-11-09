output "ip_publico" {
  value = azurerm_public_ip.ip.ip_address
}

output "url_site" {
  value = "http://${azurerm_public_ip.ip.ip_address}"
}
