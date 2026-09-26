# Segundo Programa — Terraform en Azure (Redes)

Práctica de la materia **Extracción del conocimiento en bases de datos** (IDGS, 9° cuatrimestre).
Despliega, mediante Terraform, la infraestructura de red base en Azure: grupo de recursos,
red virtual, subredes y grupo de seguridad de red (NSG).

## Estructura

| Archivo | Contenido | Video de referencia |
|---|---|---|
| `providers.tf` | Provider `azurerm` | 10, 12 |
| `variables.tf` | Declaración de variables | 11, 2 |
| `terraform.tfvars.example` | Plantilla de valores | 12 |
| `locals.tf` | Valores locales (nombres derivados) | 11, 4 |
| `main.tf` | Recursos (RG, VNet, Subredes, NSG) | 13, 15 |
| `outputs.tf` | Salidas | 14, 5 |
| `Comandos para habilitar la configuracion de redes en Azure.txt` | Comandos Azure CLI usados | 7, 8, 9, 10 |

## Cómo ejecutar

```bash
az login
az provider register --namespace Microsoft.Network

cp terraform.tfvars.example terraform.tfvars
# editar terraform.tfvars con tu subscription_id real

terraform init
terraform plan  -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"
```

Al terminar de tomar las capturas para el reporte de evidencias, liberar los recursos:

```bash
terraform destroy -var-file="terraform.tfvars"
```

## Historial de commits sugerido

Para dejar un historial claro, se recomienda un commit por etapa (en este orden):

1. `chore: init repo, .gitignore`
2. `feat: configurar provider azurerm (video 10, 12)`
3. `feat: agregar variables y locals (video 11, 2, 4)`
4. `feat: agregar terraform.tfvars.example (video 12)`
5. `feat: crear recursos de red - RG, VNet, subredes, NSG (video 13, 15)`
6. `feat: agregar outputs (video 14, 5)`
7. `docs: agregar comandos de Azure CLI y README`
8. `docs: agregar reporte de evidencias`
