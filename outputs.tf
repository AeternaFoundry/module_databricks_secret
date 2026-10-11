output "secrets_id" {
  description = "Map of id values across all secrets, keyed the same as var.secrets except keys with no id are omitted"
  value       = { for k, v in databricks_secret.secrets : k => v.id if v.id != null && length(v.id) > 0 }
}
output "secrets_config_reference" {
  description = "Map of config_reference values across all secrets, keyed the same as var.secrets except keys with no config_reference are omitted"
  value       = { for k, v in databricks_secret.secrets : k => v.config_reference if v.config_reference != null && length(v.config_reference) > 0 }
}
output "secrets_key" {
  description = "Map of key values across all secrets, keyed the same as var.secrets except keys with no key are omitted"
  value       = { for k, v in databricks_secret.secrets : k => v.key if v.key != null && length(v.key) > 0 }
}
output "secrets_last_updated_timestamp" {
  description = "Map of last_updated_timestamp values across all secrets, keyed the same as var.secrets except keys with no last_updated_timestamp are omitted"
  value       = { for k, v in databricks_secret.secrets : k => v.last_updated_timestamp if v.last_updated_timestamp != null }
}
output "secrets_provider_config" {
  description = "Map of provider_config values across all secrets, keyed the same as var.secrets except keys with no provider_config are omitted"
  value       = { for k, v in databricks_secret.secrets : k => one(v.provider_config) if v.provider_config != null && length(v.provider_config) > 0 }
}
output "secrets_scope" {
  description = "Map of scope values across all secrets, keyed the same as var.secrets except keys with no scope are omitted"
  value       = { for k, v in databricks_secret.secrets : k => v.scope if v.scope != null && length(v.scope) > 0 }
}
output "secrets_string_value" {
  description = "Map of string_value values across all secrets, keyed the same as var.secrets except keys with no string_value are omitted"
  value       = { for k, v in databricks_secret.secrets : k => v.string_value if v.string_value != null && length(v.string_value) > 0 }
  sensitive   = true
}
output "secrets_string_value_wo_version" {
  description = "Map of string_value_wo_version values across all secrets, keyed the same as var.secrets except keys with no string_value_wo_version are omitted"
  value       = { for k, v in databricks_secret.secrets : k => v.string_value_wo_version if v.string_value_wo_version != null }
}

