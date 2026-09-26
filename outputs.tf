# outputs.tf
# Corresponde a: "14 Salidas.mp4"
#                "5 ouputs.mp4"

output "resource_group_name" {
  description = "Nombre del grupo de recursos creado."
  value       = azurerm_resource_group.main.name
}

output "vnet_id" {
  description = "ID de la red virtual creada."
  value       = azurerm_virtual_network.main.id
}

output "vnet_name" {
  description = "Nombre de la red virtual creada."
  value       = azurerm_virtual_network.main.name
}

output "subnet_ids" {
  description = "Mapa de nombre de subred => ID de subred."
  value       = { for k, s in azurerm_subnet.subnets : k => s.id }
}

output "nsg_id" {
  description = "ID del grupo de seguridad de red."
  value       = azurerm_network_security_group.main.id
}
