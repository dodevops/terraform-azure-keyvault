# Configure a common keyvault to store secrets

resource "azurerm_key_vault" "keyvault" {
  name                = "${lower(var.project)}${lower(var.stage)}keyvault"
  location            = var.location
  resource_group_name = var.resource_group
  tenant_id           = var.azure_tenant_id
  sku_name            = var.sku

  purge_protection_enabled = false
}
