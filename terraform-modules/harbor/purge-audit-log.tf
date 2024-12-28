resource "harbor_purge_audit_log" "purge_audit_log" {
  for_each             = { for key, value in var.harbor_purge_audit_log : key => value }
  schedule             = each.value.schedule
  audit_retention_hour = each.value.audit_retention_hour
  include_operations   = each.value.include_operations
}
