# locals.tf
# Corresponde a: "11 Creacion de variables y locals.mp4"
#                "4 locals.mp4"

locals {
  # Prefijo común para nombrar todos los recursos: idgs-lab-dev
  name_prefix = "${var.project_name}-${var.environment}"

  resource_group_name = "${local.name_prefix}-rg"
  vnet_name            = "${local.name_prefix}-vnet"
  nsg_name             = "${local.name_prefix}-nsg"

  common_tags = merge(
    var.tags,
    {
      environment = var.environment
      managed_by  = "terraform"
    }
  )
}
