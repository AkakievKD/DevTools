resource "harbor_project_member_group" "project_member_group" {
  for_each      = { for key, value in var.harbor_project_member_group : key => value }
  project_id    = each.value.project_id
  group_name    = each.value.group_name
  role          = each.value.role
  type          = each.value.type
  group_id      = each.value.group_id
  ldap_group_dn = each.value.ldap_group_dn
}
