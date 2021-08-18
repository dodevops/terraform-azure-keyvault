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

variable "allowed_objectid_apps_fullaccess" {
  type        = list(string)
  description = "A list of object IDs with allowed apps (in the form of <objectid>:<app>) that are allowed to fully access the keyvault"
  default     = []
}

variable "allowed_objectids_readonly" {
  type        = list(string)
  description = "A list of object IDs that are allowed to read elements in the keyvault"
  default     = []
}

variable "allowed_objectid_apps_readonly" {
  type        = list(string)
  description = "A list of object IDs with allowed apps (in the form of <objectid>:<app>) that are allowed to read elements the keyvault"
  default     = []
}

variable "allowed_objectids_createonly" {
  type        = list(string)
  description = "A list of object IDs that are allowed to create (but not read or change) elements in the keyvault"
  default     = []
}

variable "allowed_objectid_apps_createonly" {
  type        = list(string)
  description = "A list of object IDs with allowed apps (in the form of <objectid>:<app>) that are allowed to create (but not read or change) elements the keyvault"
  default     = []
}

variable "soft_delete_enabled" {
  type        = bool
  description = "Toggles if soft delete is enabled"
  default     = false
}

variable "enable_audit" {
  type        = bool
  description = "Enable audit of keyvault changes"
  default     = false
}

variable "audit_retention_period" {
  type        = number
  description = "Sets number of days to keep audit records, if audit is enabled"
  default     = 365
}
