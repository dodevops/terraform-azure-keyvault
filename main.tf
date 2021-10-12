resource "azurerm_key_vault" "keyvault" {
  name                     = "${lower(var.project)}${lower(var.stage)}keyvault"
  location                 = var.location
  resource_group_name      = var.resource_group
  tenant_id                = var.azure_tenant_id
  sku_name                 = var.sku
  purge_protection_enabled = false
  soft_delete_enabled      = var.soft_delete_enabled
  tags                     = var.tags
}

resource "azurerm_storage_account" "storageaccountkeyvaultaudit" {
  count                    = var.enable_audit ? 1 : 0
  name                     = "${lower(var.project)}${lower(var.stage)}keyvaultaudit"
  resource_group_name      = var.resource_group
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.tags
}

resource "azurerm_monitor_diagnostic_setting" "keyvaultaudit" {
  count              = var.enable_audit ? 1 : 0
  name               = "${lower(var.project)}${lower(var.stage)}keyvaultaudit"
  target_resource_id = azurerm_key_vault.keyvault.id
  storage_account_id = azurerm_storage_account.storageaccountkeyvaultaudit.id

  log {
    category = "AuditEvent"
    enabled  = true

    retention_policy {
      enabled = true
      days    = var.audit_retention_period
    }
  }

  metric {
    category = "AllMetrics"
    enabled  = false

    retention_policy {
      enabled = false
    }
  }
}