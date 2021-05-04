resource "azurerm_key_vault_access_policy" "keyvault-access-policy-objectids" {
  count        = length(var.allowed_objectids)
  object_id    = element(var.allowed_objectids, count.index)
  tenant_id    = var.azure_tenant_id
  key_vault_id = azurerm_key_vault.keyvault.id

  key_permissions = [
    "get",
    "list",
    "delete",
    "create",
    "update",
    "import",
    "backup",
    "recover"
  ]

  secret_permissions = [
    "get",
    "list",
    "delete",
    "set",
    "backup",
    "recover",
    "restore"
  ]

  certificate_permissions = [
    "get",
    "list",
    "update",
    "create",
    "import",
    "delete",
    "backup",
    "recover"
  ]
}

resource "azurerm_key_vault_access_policy" "keyvault-access-policy-objectid-apps" {
  count          = length(var.allowed_objectid_apps)
  object_id      = element(split(":", element(var.allowed_objectid_apps, count.index)), 0)
  application_id = element(split(":", element(var.allowed_objectid_apps, count.index)), 1)
  tenant_id      = var.azure_tenant_id
  key_vault_id   = azurerm_key_vault.keyvault.id

  key_permissions = [
    "get",
    "list",
    "delete",
    "create",
    "update",
    "import"
  ]

  secret_permissions = [
    "get",
    "list",
    "delete",
    "set"
  ]

  certificate_permissions = [
    "get",
    "list",
    "update",
    "create",
    "import",
    "delete"
  ]
}
