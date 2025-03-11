resource "nexus_security_ldap" "security_ldap" {
  for_each = var.nexus_security_ldap

  auth_password                  = each.value.auth_password
  auth_realm                     = each.value.auth_realm
  auth_schema                    = each.value.auth_schema
  auth_username                  = each.value.auth_username
  connection_retry_delay_seconds = each.value.connection_retry_delay_seconds
  connection_timeout_seconds     = each.value.connection_timeout_seconds
  group_base_dn                  = each.value.group_base_dn
  group_id_attribute             = each.value.group_id_attribute
  group_member_attribute         = each.value.group_member_attribute
  group_member_format            = each.value.group_member_format
  group_object_class             = each.value.group_object_class
  group_subtree                  = each.value.group_subtree
  group_type                     = each.value.group_type
  host                           = each.value.host
  use_trust_store                = each.value.use_trust_store
  ldap_groups_as_roles           = each.value.ldap_groups_as_roles
  max_incident_count             = each.value.max_incident_count
  name                           = each.value.name
  port                           = each.value.port
  protocol                       = each.value.protocol
  search_base                    = each.value.search_base
  user_base_dn                   = each.value.user_base_dn
  user_email_address_attribute   = each.value.user_email_address_attribute
  user_id_attribute              = each.value.user_id_attribute
  user_ldap_filter               = each.value.user_ldap_filter
  user_member_of_attribute       = each.value.user_member_of_attribute
  user_object_class              = each.value.user_object_class
  user_password_attribute        = each.value.user_password_attribute
  user_real_name_attribute       = each.value.user_real_name_attribute
  user_subtree                   = each.value.user_subtree
}
