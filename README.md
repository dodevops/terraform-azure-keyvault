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
- [azurerm_key_vault_access_policy.keyvault-access-policy-objectid-apps](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) (resource)
- [azurerm_key_vault_access_policy.keyvault-access-policy-objectids](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) (resource)

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

### allowed\_objectid\_apps

Description: A list of object IDs with allowed apps (in the form of <objectid>:<app>) that are allowed to access the keyvault

Type: `list(string)`

Default: `[]`

### allowed\_objectids

Description: A list of object IDs that are allowed to access the keyvault

Type: `list(string)`

Default: `[]`

### sku

Description: Keyvault sku

Type: `string`

Default: `"standard"`

## Outputs

No outputs.
<!-- END_TF_DOCS -->

## Development

Use [terraform-docs](https://terraform-docs.io/) to generate the API documentation by running

    terraform fmt .
    terraform-docs .
