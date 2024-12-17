variable "location" {
  type        = string
  description = "The azure location used for azure"
}

variable "project" {
  type        = string
  description = "Three letter project key"
}

variable "stage" {
  type        = string
  description = "Stage for this ressource group"
}

variable "resource_group" {
  type        = string
  description = "Azure Resource Group to use"
}

variable "tags" {
  type        = map(any)
  description = "Map of tags for the resources"
  default     = {}
}

variable "sku" {
  type        = string
  description = "Keyvault sku"
  default     = "standard"
}

variable "azure_tenant_id" {
  type        = string
  description = "The tenant id used for azure"
}

variable "allowed_objectids_fullaccess" {
  type        = list(string)
  description = "A list of object IDs that are allowed to fully access the keyvault elements (with all operations)"
  default     = []
}

variable "allowed_objectid_app_tuples_fullaccess" {
  type        = list(string)
  description = "A list of object IDs with allowed apps (in the form of <objectid>:<app>) that are allowed to fully access the keyvault"
  default     = []
}

variable "allowed_objectids_readonly" {
  type        = list(string)
  description = "A list of object IDs that are allowed to read elements in the keyvault"
  default     = []
}

variable "allowed_objectid_app_tuples_readonly" {
  type        = list(string)
  description = "A list of object IDs with allowed apps (in the form of <objectid>:<app>) that are allowed to read elements the keyvault"
  default     = []
}

variable "allowed_objectids_createonly" {
  type        = list(string)
  description = "A list of object IDs that are allowed to create (but not read or change) elements in the keyvault"
  default     = []
}

variable "allowed_objectid_app_tuples_createonly" {
  type        = list(string)
  description = "A list of object IDs with allowed apps (in the form of <objectid>:<app>) that are allowed to create (but not read or change) elements the keyvault"
  default     = []
}

variable "enable_audit" {
  type        = bool
  description = "Enable audit of keyvault changes"
  default     = false
}

variable "soft_delete_retention_days" {
  type        = number
  description = "The number of days that items should be retained for once soft-deleted. This value can be between 7 and 90 days"
  default     = 14
}

variable "network_acls_bypass" {
  type        = string
  description = "Specifies which traffic can bypass the network rules. Possible values are AzureServices and None."
  default     = "None"
}

variable "network_acls_default_action" {
  type        = string
  description = "The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids. Possible values are Allow and Deny."
  default     = "Deny"
}

variable "network_acls_ip_rules" {
  type        = list(string)
  description = "List of one or more IP Addresses, or CIDR Blocks which should be able to access the Key Vault. If default action is Allow this can be an empty list"
}

variable "network_acls_virtual_network_subnet_ids" {
  type        = list(string)
  description = "List of one or more Subnet IDs which should be able to access this Key Vault. If default action is Allow this can be an empty list"
}
