# variables.tf
# Corresponde a: "11 Creacion de variables y locals.mp4"
#                "2 Variables.mp4"

variable "subscription_id" {
  description = "ID de la suscripción de Azure donde se crearán los recursos."
  type        = string
}

variable "location" {
  description = "Región de Azure donde se despliegan los recursos."
  type        = string
  default     = "eastus"
}

variable "environment" {
  description = "Etiqueta del entorno (dev, qa, prod)."
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "Nombre base del proyecto, usado como prefijo de los recursos."
  type        = string
  default     = "idgs-lab"
}

variable "vnet_address_space" {
  description = "Espacio de direcciones CIDR de la red virtual."
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_prefixes" {
  description = "Mapa de subredes: nombre => prefijo CIDR."
  type        = map(string)
  default = {
    frontend = "10.0.1.0/24"
    backend  = "10.0.2.0/24"
  }
}

variable "tags" {
  description = "Etiquetas comunes aplicadas a todos los recursos."
  type        = map(string)
  default = {
    curso    = "Extraccion del conocimiento en bases de datos"
    practica = "segundo-programa"
  }
}
