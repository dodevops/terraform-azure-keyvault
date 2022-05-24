resource "azurerm_key_vault" "keyvault" {
  name                       = "${lower(var.project)}${lower(var.stage)}keyvault"
  location                   = var.location
  resource_group_name        = var.resource_group
  tenant_id                  = var.azure_tenant_id
  sku_name                   = var.sku
  tags                       = var.tags
  purge_protection_enabled   = true
  soft_delete_retention_days = var.soft_delete_retention_days

  network_acls {
    bypass                     = var.network_acls_bypass
    default_action             = var.network_acls_default_action
    ip_rules                   = var.network_acls_ip_rules
    virtual_network_subnet_ids = var.network_acls_virtual_network_subnet_ids
  }
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
  storage_account_id = azurerm_storage_account.storageaccountkeyvaultaudit[0].id

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