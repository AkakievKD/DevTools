resource "rancher2_auth_config_activedirectory" "auth_config_activedirectory" {
  count = var.rancher2_auth_config_activedirectory == null ? 0 : 1

  servers                         = var.rancher2_auth_config_activedirectory.servers
  service_account_username        = var.rancher2_auth_config_activedirectory.service_account_username
  service_account_password        = var.rancher2_auth_config_activedirectory.service_account_password
  test_username                   = var.rancher2_auth_config_activedirectory.test_username
  test_password                   = var.rancher2_auth_config_activedirectory.test_password
  user_search_base                = var.rancher2_auth_config_activedirectory.user_search_base
  access_mode                     = var.rancher2_auth_config_activedirectory.access_mode
  allowed_principal_ids           = var.rancher2_auth_config_activedirectory.allowed_principal_ids
  default_login_domain            = var.rancher2_auth_config_activedirectory.default_login_domain
  certificate                     = var.rancher2_auth_config_activedirectory.certificate
  connection_timeout              = var.rancher2_auth_config_activedirectory.connection_timeout
  port                            = var.rancher2_auth_config_activedirectory.port
  tls                             = var.rancher2_auth_config_activedirectory.tls
  start_tls                       = var.rancher2_auth_config_activedirectory.start_tls
  enabled                         = var.rancher2_auth_config_activedirectory.enabled
  group_search_base               = var.rancher2_auth_config_activedirectory.group_search_base
  group_dn_attribute              = var.rancher2_auth_config_activedirectory.group_dn_attribute
  group_member_mapping_attribute  = var.rancher2_auth_config_activedirectory.group_member_mapping_attribute
  group_member_user_attribute     = var.rancher2_auth_config_activedirectory.group_member_user_attribute
  group_name_attribute            = var.rancher2_auth_config_activedirectory.group_name_attribute
  group_object_class              = var.rancher2_auth_config_activedirectory.group_object_class
  group_search_attribute          = var.rancher2_auth_config_activedirectory.group_search_filter
  group_search_filter             = var.rancher2_auth_config_activedirectory.group_search_filter
  nested_group_membership_enabled = var.rancher2_auth_config_activedirectory.nested_group_membership_enabled
  user_disabled_bit_mask          = var.rancher2_auth_config_activedirectory.user_disabled_bit_mask
  user_enabled_attribute          = var.rancher2_auth_config_activedirectory.user_enabled_attribute
  user_login_attribute            = var.rancher2_auth_config_activedirectory.user_login_attribute
  user_name_attribute             = var.rancher2_auth_config_activedirectory.user_name_attribute
  user_object_class               = var.rancher2_auth_config_activedirectory.user_object_class
  user_search_attribute           = var.rancher2_auth_config_activedirectory.user_search_attribute
  user_search_filter              = var.rancher2_auth_config_activedirectory.user_search_filter
  annotations                     = var.rancher2_auth_config_activedirectory.annotations
  labels                          = var.rancher2_auth_config_activedirectory.labels
}
