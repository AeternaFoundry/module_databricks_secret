resource "databricks_secret" "secrets" {
  for_each = var.secrets

  key                     = each.value.key
  scope                   = each.value.scope
  string_value            = each.value.string_value
  string_value_wo         = each.value.string_value_wo
  string_value_wo_version = each.value.string_value_wo_version

  dynamic "provider_config" {
    for_each = each.value.provider_config != null ? [each.value.provider_config] : []
    content {
      workspace_id = provider_config.value.workspace_id
    }
  }
}

