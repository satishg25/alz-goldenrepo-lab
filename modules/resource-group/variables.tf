variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
  validation {
    condition     = length(trimspace(var.resource_group_name)) > 0
    error_message = "Resource Group Name cannot be empty."
  }
}

variable "location" {
  description = "Azure Region"
  type        = string
  default     = "westeurope"

  validation {
    condition = contains(
      [
        "westeurope",
        "northeurope",
        "uksouth",
        "ukwest"
      ],
      lower(var.location)
    )
    error_message = "Location must be a supported Azure region."
  }
}
