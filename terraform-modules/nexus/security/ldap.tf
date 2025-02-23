resource "nexus_security_ldap" "security_ldap" {
  count = var.nexus_security_ldap == null ? 0 : 1

  auth_password                  = var.nexus_security_ldap.auth_password
  auth_realm                     = var.nexus_security_ldap.auth_realm
  auth_schema                    = var.nexus_security_ldap.auth_schema
  auth_username                  = var.nexus_security_ldap.auth_username
  connection_retry_delay_seconds = var.nexus_security_ldap.connection_retry_delay_seconds
  connection_timeout_seconds     = var.nexus_security_ldap.connection_timeout_seconds
  group_base_dn                  = var.nexus_security_ldap.group_base_dn
  group_id_attribute             = var.nexus_security_ldap.group_id_attribute
  group_member_attribute         = var.nexus_security_ldap.group_member_attribute
  group_member_format            = var.nexus_security_ldap.group_member_format
  group_object_class             = var.nexus_security_ldap.group_object_class
  group_subtree                  = var.nexus_security_ldap.group_subtree
  group_type                     = var.nexus_security_ldap.group_type
  host                           = var.nexus_security_ldap.host
  use_trust_store                = var.nexus_security_ldap.use_trust_store
  ldap_groups_as_roles           = var.nexus_security_ldap.ldap_groups_as_roles
  max_incident_count             = var.nexus_security_ldap.max_incident_count
  name                           = var.nexus_security_ldap.name
  port                           = var.nexus_security_ldap.port
  protocol                       = var.nexus_security_ldap.protocol
  search_base                    = var.nexus_security_ldap.search_base
  user_base_dn                   = var.nexus_security_ldap.user_base_dn
  user_email_address_attribute   = var.nexus_security_ldap.user_email_address_attribute
  user_id_attribute              = var.nexus_security_ldap.user_id_attribute
  user_ldap_filter               = var.nexus_security_ldap.user_ldap_filter
  user_member_of_attribute       = var.nexus_security_ldap.user_member_of_attribute
  user_object_class              = var.nexus_security_ldap.user_object_class
  user_password_attribute        = var.nexus_security_ldap.user_password_attribute
  user_real_name_attribute       = var.nexus_security_ldap.user_real_name_attribute
  user_subtree                   = var.nexus_security_ldap.user_subtree
}
