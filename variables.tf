variable "secrets" {
  description = <<EOT
Map of secrets, attributes below
Required:
    - key
    - scope
Optional:
    - string_value
    - string_value_wo
    - string_value_wo_version
    - provider_config (block):
        - workspace_id (optional)
EOT

  type = map(object({
    key                     = string
    scope                   = string
    string_value            = optional(string)
    string_value_wo         = optional(string)
    string_value_wo_version = optional(number)
    provider_config = optional(object({
      workspace_id = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.secrets : (
        v.string_value == null || (length(v.string_value) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.secrets : (
        v.string_value_wo == null || (length(v.string_value_wo) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  # Note: 2 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

