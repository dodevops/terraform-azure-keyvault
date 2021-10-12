# Azure Keyvault management

## Introduction

This module manages a keyvault resource in Azure with the required permissions.

## Usage

Instantiate the module by calling it from Terraform like this:

```hcl
module "azure-keyvault" {
  source = "dodevops/keyvault/azure"
  version = "<version>" 
  (...)
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

The following providers are used by this module:

- azurerm

## Modules

No modules.

## Resources

The following resources are used by this module:

- [azurerm_key_vault.keyvault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) (resource)
- [azurerm_key_vault_access_policy.keyvault-access-policy-objectid-apps-createonly](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) (resource)
- [azurerm_key_vault_access_policy.keyvault-access-policy-objectid-apps-fullaccess](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) (resource)
- [azurerm_key_vault_access_policy.keyvault-access-policy-objectid-apps-readonly](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) (resource)
- [azurerm_key_vault_access_policy.keyvault-access-policy-objectids-createonly](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) (resource)
- [azurerm_key_vault_access_policy.keyvault-access-policy-objectids-fullaccess](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) (resource)
- [azurerm_key_vault_access_policy.keyvault-access-policy-objectids-readonly](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) (resource)
- [azurerm_monitor_diagnostic_setting.keyvaultaudit](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) (resource)
- [azurerm_storage_account.storageaccountkeyvaultaudit](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) (resource)

## Required Inputs

The following input variables are required:

### azure\_tenant\_id

Description: The tenant id used for azure

Type: `string`

### location

Description: The azure location used for azure

Type: `string`

### project

Description: Three letter project key

Type: `string`

### resource\_group

Description: Azure Resource Group to use

Type: `string`

### stage

Description: Stage for this ressource group

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### allowed\_objectid\_app\_tuples\_createonly

Description: A list of object IDs with allowed apps (in the form of <objectid>:<app>) that are allowed to create (but not read or change) elements the keyvault

Type: `list(string)`

Default: `[]`

### allowed\_objectid\_app\_tuples\_fullaccess

Description: A list of object IDs with allowed apps (in the form of <objectid>:<app>) that are allowed to fully access the keyvault

Type: `list(string)`

Default: `[]`

### allowed\_objectid\_app\_tuples\_readonly

Description: A list of object IDs with allowed apps (in the form of <objectid>:<app>) that are allowed to read elements the keyvault

Type: `list(string)`

Default: `[]`

### allowed\_objectids\_createonly

Description: A list of object IDs that are allowed to create (but not read or change) elements in the keyvault

Type: `list(string)`

Default: `[]`

### allowed\_objectids\_fullaccess

Description: A list of object IDs that are allowed to fully access the keyvault elements (with all operations)

Type: `list(string)`

Default: `[]`

### allowed\_objectids\_readonly

Description: A list of object IDs that are allowed to read elements in the keyvault

Type: `list(string)`

Default: `[]`

### audit\_retention\_period

Description: Sets number of days to keep audit records, if audit is enabled

Type: `number`

Default: `365`

### enable\_audit

Description: Enable audit of keyvault changes

Type: `bool`

Default: `false`

### sku

Description: Keyvault sku

Type: `string`

Default: `"standard"`

### soft\_delete\_enabled

Description: Toggles if soft delete is enabled

Type: `bool`

Default: `false`

### tags

Description: Map of tags for the resources

Type: `map(any)`

Default: `{}`

## Outputs

The following outputs are exported:

### vault\_id

Description: n/a
<!-- END_TF_DOCS -->

## Development

Use [terraform-docs](https://terraform-docs.io/) to generate the API documentation by running

    terraform fmt .
    terraform-docs .
