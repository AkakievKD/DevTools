resource "harbor_group" "group" {
  for_each      = { for key in var.harbor_group : key.group_name => key }
  group_name    = each.value.group_name
  group_type    = each.value.group_type
  ldap_group_dn = each.value.ldap_group_dn
}
