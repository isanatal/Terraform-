# main.tf
# Corresponde a: "13 Configuracion de recursos.mp4"
#                "15 Creacion de elementos.mp4"

# 1. Grupo de recursos
resource "azurerm_resource_group" "main" {
  name     = local.resource_group_name
  location = var.location
  tags     = local.common_tags
}

# 2. Red virtual (Virtual Network)
resource "azurerm_virtual_network" "main" {
  name                = local.vnet_name
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  tags                = local.common_tags
}

# 3. Subredes (una por cada entrada del mapa subnet_prefixes)
resource "azurerm_subnet" "subnets" {
  for_each = var.subnet_prefixes

  name                 = "${local.name_prefix}-${each.key}-subnet"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [each.value]
}

# 4. Grupo de seguridad de red (NSG)
resource "azurerm_network_security_group" "main" {
  name                = local.nsg_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  tags                = local.common_tags

  security_rule {
    name                       = "Allow-SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# 5. Asociación del NSG a la subred "frontend"
resource "azurerm_subnet_network_security_group_association" "frontend" {
  subnet_id                 = azurerm_subnet.subnets["frontend"].id
  network_security_group_id = azurerm_network_security_group.main.id
}
