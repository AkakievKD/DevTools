resource "harbor_config_system" "config_system" {
  for_each                     = { for key, value in var.harbor_config_system : key => value }
  project_creation_restriction = each.value.project_creation_restriction
  robot_token_expiration       = each.value.robot_token_expiration
  robot_name_prefix            = each.value.robot_name_prefix
  storage_per_project          = each.value.storage_per_project
  scanner_skip_update_pulltime = each.value.scanner_skip_update_pulltime
  read_only                    = each.value.read_only
  audit_log_forward_endpoint   = each.value.audit_log_forward_endpoint
  skip_audit_log_database      = each.value.skip_audit_log_database

  dynamic "banner_message" {
    for_each = can(each.value.banner_message) && each.value.banner_message != null ? [each.value.banner_message] : []
    content {
      message   = banner_message.value.message
      closable  = banner_message.value.closable
      type      = banner_message.value.type
      from_date = banner_message.value.from_date
      to_date   = banner_message.value.to_date
    }
  }
}
