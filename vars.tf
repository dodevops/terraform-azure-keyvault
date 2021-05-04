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

variable "allowed_objectids" {
  type        = list(string)
  description = "A list of object IDs that are allowed to access the keyvault"
  default     = []
}

variable "allowed_objectid_apps" {
  type        = list(string)
  description = "A list of object IDs with allowed apps (in the form of <objectid>:<app>) that are allowed to access the keyvault"
  default     = []
}
