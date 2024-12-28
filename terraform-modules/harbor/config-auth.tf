resource "harbor_config_auth" "auth_mode" {
  for_each              = { for key, value in var.harbor_config_auth : key => value }
  auth_mode             = each.key
  primary_auth_mode     = each.value.primary_auth_mode
  oidc_name             = each.value.oidc_name
  oidc_endpoint         = each.value.oidc_endpoint
  oidc_client_id        = each.value.oidc_client_id
  oidc_client_secret    = each.value.oidc_client_secret
  oidc_scope            = each.value.oidc_scope
  oidc_verify_cert      = each.value.oidc_verify_cert
  oidc_auto_onboard     = each.value.oidc_auto_onboard
  oidc_admin_group      = each.value.oidc_admin_group
  oidc_group_filter     = each.value.oidc_group_filter
  oidc_groups_claim     = each.value.oidc_groups_claim
  oidc_user_claim       = each.value.oidc_user_claim
  ldap_url              = each.value.ldap_url
  ldap_search_dn        = each.value.ldap_search_dn
  ldap_search_password  = each.value.ldap_search_password
  ldap_base_dn          = each.value.ldap_base_dn
  ldap_uid              = each.value.ldap_uid
  ldap_verify_cert      = each.value.ldap_verify_cert
  ldap_filter           = each.value.ldap_filter
  ldap_group_admin_dn   = each.value.ldap_group_admin_dn
  ldap_group_base_dn    = each.value.ldap_group_base_dn
  ldap_group_gid        = each.value.ldap_group_gid
  ldap_group_membership = each.value.ldap_group_membership
  ldap_group_scope      = each.value.ldap_group_scope
  ldap_group_filter     = each.value.ldap_group_filter
  ldap_group_uid        = each.value.ldap_group_uid
}

