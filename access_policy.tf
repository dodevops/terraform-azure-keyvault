resource "azurerm_key_vault_access_policy" "keyvault-access-policy-objectids" {
  count        = length(var.allowed_objectids)
  object_id    = element(var.allowed_objectids, count.index)
  tenant_id    = var.azure_tenant_id
  key_vault_id = lower(azurerm_key_vault.keyvault.id)

  key_permissions = [
    "Get",
    "List",
    "Delete",
    "Create",
    "Update",
    "Import",
    "Backup",
    "Recover"
  ]

  secret_permissions = [
    "Get",
    "List",
    "Delete",
    "Set",
    "Backup",
    "Recover",
    "Restore"
  ]

  certificate_permissions = [
    "Get",
    "List",
    "Update",
    "Create",
    "Import",
    "Delete",
    "Backup",
    "Recover"
  ]

  storage_permissions = []
}

resource "azurerm_key_vault_access_policy" "keyvault-access-policy-objectid-apps" {
  count          = length(var.allowed_objectid_apps)
  object_id      = element(split(":", element(var.allowed_objectid_apps, count.index)), 0)
  application_id = element(split(":", element(var.allowed_objectid_apps, count.index)), 1)
  tenant_id      = var.azure_tenant_id
  key_vault_id = lower(azurerm_key_vault.keyvault.id)

  key_permissions = [
    "Get",
    "List",
    "Delete",
    "Create",
    "Update",
    "Import"
  ]

  secret_permissions = [
    "Get",
    "List",
    "Delete",
    "Set"
  ]

  certificate_permissions = [
    "Get",
    "List",
    "Update",
    "Create",
    "Import",
    "Delete"
  ]

  storage_permissions = []
}
