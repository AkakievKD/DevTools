resource "nexus_privilege_script" "privilege_script" {
  for_each = { for key, value in var.nexus_privilege_script : key => value }

  name        = each.key
  description = each.value.description
  actions     = each.value.actions
  script_name = each.value.script_name
}
