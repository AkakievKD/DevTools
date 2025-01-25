variable "rancher2_auth_config_activedirectory" {
  type = object({
    servers                         = list(string)
    service_account_username        = string
    service_account_password        = string
    test_username                   = string
    test_password                   = string
    user_search_base                = string
    access_mode                     = optional(string)
    allowed_principal_ids           = optional(list(string))
    default_login_domain            = optional(string)
    certificate                     = optional(string)
    connection_timeout              = optional(number)
    port                            = optional(number)
    tls                             = optional(bool)
    start_tls                       = optional(bool)
    enabled                         = optional(bool)
    group_search_base               = optional(string)
    group_dn_attribute              = optional(string)
    group_member_mapping_attribute  = optional(string)
    group_member_user_attribute     = optional(string)
    group_name_attribute            = optional(string)
    group_object_class              = optional(string)
    group_search_attribute          = optional(string)
    group_search_filter             = optional(string)
    nested_group_membership_enabled = optional(bool)
    user_disabled_bit_mask          = optional(number)
    user_enabled_attribute          = optional(string)
    user_login_attribute            = optional(string)
    user_name_attribute             = optional(string)
    user_object_class               = optional(string)
    user_search_attribute           = optional(string)
    user_search_filter              = optional(string)
    annotations                     = optional(map(string))
    labels                          = optional(map(string))
  })
  default = null
}

variable "rancher2_cluster" {
  type = list(object({
    name = string
  }))
  default = []
}

variable "rancher2_project" {
  type = map(object({
    cluster_id                                                      = string
    description                                                     = optional(string)
    wait_for_cluster                                                = optional(bool)
    annotations                                                     = optional(map(string))
    labels                                                          = optional(map(string))
    container_resource_limit_limits_cpu                             = optional(string)
    container_resource_limit_limits_memory                          = optional(string)
    container_resource_limit_requests_cpu                           = optional(string)
    container_resource_limit_requests_memory                        = optional(string)
    resource_quota_project_limit_config_maps                        = optional(string)
    resource_quota_project_limit_limits_cpu                         = optional(string)
    resource_quota_project_limit_limits_memory                      = optional(string)
    resource_quota_project_limit_persistent_volume_claims           = optional(string)
    resource_quota_project_limit_pods                               = optional(string)
    resource_quota_project_limit_replication_controllers            = optional(string)
    resource_quota_project_limit_requests_cpu                       = optional(string)
    resource_quota_project_limit_requests_memory                    = optional(string)
    resource_quota_project_limit_requests_storage                   = optional(string)
    resource_quota_project_limit_secrets                            = optional(string)
    resource_quota_project_limit_services_load_balancers            = optional(string)
    resource_quota_project_limit_services_node_ports                = optional(string)
    resource_quota_namespace_default_limit_config_maps              = optional(string)
    resource_quota_namespace_default_limit_limits_cpu               = optional(string)
    resource_quota_namespace_default_limit_limits_memory            = optional(string)
    resource_quota_namespace_default_limit_persistent_volume_claims = optional(string)
    resource_quota_namespace_default_limit_pods                     = optional(string)
    resource_quota_namespace_default_limit_replication_controllers  = optional(string)
    resource_quota_namespace_default_limit_requests_cpu             = optional(string)
    resource_quota_namespace_default_limit_requests_memory          = optional(string)
    resource_quota_namespace_default_limit_requests_storage         = optional(string)
    resource_quota_namespace_default_limit_secrets                  = optional(string)
    resource_quota_namespace_default_limit_services_load_balancers  = optional(string)
    resource_quota_namespace_default_limit_services_node_ports      = optional(string)
    timeouts_create                                                 = optional(string)
    timeouts_update                                                 = optional(string)
    timeouts_delete                                                 = optional(string)
  }))
  default = {}
}

variable "rancher2_namespace" {
  type = map(object({
    project_id                                    = string
    description                                   = optional(string)
    wait_for_cluster                              = optional(bool)
    annotations                                   = optional(map(string))
    labels                                        = optional(map(string))
    container_resource_limit_limits_cpu           = optional(string)
    container_resource_limit_limits_memory        = optional(string)
    container_resource_limit_requests_cpu         = optional(string)
    container_resource_limit_requests_memory      = optional(string)
    resource_quota_limit_config_maps              = optional(string)
    resource_quota_limit_limits_cpu               = optional(string)
    resource_quota_limit_limits_memory            = optional(string)
    resource_quota_limit_persistent_volume_claims = optional(string)
    resource_quota_limit_pods                     = optional(string)
    resource_quota_limit_replication_controllers  = optional(string)
    resource_quota_limit_requests_cpu             = optional(string)
    resource_quota_limit_requests_memory          = optional(string)
    resource_quota_limit_requests_storage         = optional(string)
    resource_quota_limit_secrets                  = optional(string)
    resource_quota_limit_services_load_balancers  = optional(string)
    resource_quota_limit_services_node_ports      = optional(string)
    timeouts_create                               = optional(string)
    timeouts_update                               = optional(string)
    timeouts_delete                               = optional(string)
  }))
  default = {}
}

variable "rancher2_global_role_binding" {
  type = map(object({
    global_role_id     = string
    user_id            = optional(string)
    group_principal_id = optional(string)
    annotations        = optional(map(string))
    labels             = optional(map(string))
    timeouts_create    = optional(string)
    timeouts_update    = optional(string)
    timeouts_delete    = optional(string)
  }))
  default = {}
}

variable "rancher2_project_role_template_binding" {
  type = map(object({
    project_id         = string
    role_template_id   = string
    group_id           = optional(string)
    group_principal_id = optional(string)
    user_id            = optional(string)
    user_principal_id  = optional(string)
    annotations        = optional(map(string))
    labels             = optional(map(string))
    timeouts_create    = optional(string)
    timeouts_update    = optional(string)
    timeouts_delete    = optional(string)
  }))
  default = {}
}
