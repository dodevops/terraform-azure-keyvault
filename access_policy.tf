resource "azurerm_key_vault_access_policy" "keyvault-access-policy-objectids-fullaccess" {
  count        = length(var.allowed_objectids_fullaccess)
  object_id    = element(var.allowed_objectids_fullaccess, count.index)
  tenant_id    = var.azure_tenant_id
  key_vault_id = azurerm_key_vault.keyvault.id

  key_permissions = [
    "Get",
    "List",
    "Delete",
    "Create",
    "Update",
    "Import",
    "Backup",
    "Recover",
    "Restore"
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
    "Recover",
    "Restore"
  ]

  storage_permissions = []
}

resource "azurerm_key_vault_access_policy" "keyvault-access-policy-objectid-apps-fullaccess" {
  count          = length(var.allowed_objectid_app_tuples_fullaccess)
  object_id      = element(split(":", element(var.allowed_objectid_app_tuples_fullaccess, count.index)), 0)
  application_id = element(split(":", element(var.allowed_objectid_app_tuples_fullaccess, count.index)), 1)
  tenant_id      = var.azure_tenant_id
  key_vault_id   = azurerm_key_vault.keyvault.id

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

resource "azurerm_key_vault_access_policy" "keyvault-access-policy-objectids-readonly" {
  count        = length(var.allowed_objectids_readonly)
  object_id    = element(var.allowed_objectids_readonly, count.index)
  tenant_id    = var.azure_tenant_id
  key_vault_id = azurerm_key_vault.keyvault.id

  key_permissions = [
    "Get",
    "List",
  ]

  secret_permissions = [
    "Get",
    "List",
  ]

  certificate_permissions = [
    "Get",
    "List",
  ]

  storage_permissions = []
}

resource "azurerm_key_vault_access_policy" "keyvault-access-policy-objectid-apps-readonly" {
  count          = length(var.allowed_objectid_app_tuples_readonly)
  object_id      = element(split(":", element(var.allowed_objectid_app_tuples_readonly, count.index)), 0)
  application_id = element(split(":", element(var.allowed_objectid_app_tuples_readonly, count.index)), 1)
  tenant_id      = var.azure_tenant_id
  key_vault_id   = azurerm_key_vault.keyvault.id

  key_permissions = [
    "Get",
    "List",
  ]

  secret_permissions = [
    "Get",
    "List",
  ]

  certificate_permissions = [
    "Get",
    "List",
  ]

  storage_permissions = []
}

resource "azurerm_key_vault_access_policy" "keyvault-access-policy-objectids-createonly" {
  count        = length(var.allowed_objectids_createonly)
  object_id    = element(var.allowed_objectids_createonly, count.index)
  tenant_id    = var.azure_tenant_id
  key_vault_id = azurerm_key_vault.keyvault.id

  key_permissions = [
    "Create",
    "List",
  ]

  secret_permissions = [
    "Set",
    "List",
  ]

  certificate_permissions = [
    "Create",
    "List",
  ]

  storage_permissions = []
}

resource "azurerm_key_vault_access_policy" "keyvault-access-policy-objectid-apps-createonly" {
  count          = length(var.allowed_objectid_app_tuples_createonly)
  object_id      = element(split(":", element(var.allowed_objectid_app_tuples_createonly, count.index)), 0)
  application_id = element(split(":", element(var.allowed_objectid_app_tuples_createonly, count.index)), 1)
  tenant_id      = var.azure_tenant_id
  key_vault_id   = azurerm_key_vault.keyvault.id

  key_permissions = [
    "Create",
    "List",
  ]

  secret_permissions = [
    "Set",
    "List",
  ]

  certificate_permissions = [
    "Create",
    "List",
  ]

  storage_permissions = []
}