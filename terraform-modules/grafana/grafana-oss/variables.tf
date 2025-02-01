variable "grafana_data_source" {
  type = map(object({
    name                                   = string
    type                                   = string
    url                                    = optional(string)
    access_mode                            = optional(string)
    is_default                             = optional(bool)
    org_id                                 = optional(string)
    basic_auth_enabled                     = optional(bool)
    basic_auth_username                    = optional(string)
    username                               = optional(string)
    database_name                          = optional(string)
    json_data_encoded                      = optional(string)
    secure_json_data_encoded               = optional(string)
    uid                                    = optional(string)
    http_headers                           = optional(map(string))
    private_data_source_connect_network_id = optional(string)
  }))
  default = {}
}

variable "grafana_service_account" {
  type = map(object({
    name        = string
    role        = string
    is_disabled = optional(bool)
    org_id      = optional(string)
  }))
  default = {}
}

variable "grafana_service_account_permission" {
  type = list(object({
    org_id             = optional(string)
    service_account_id = string

    permissions = optional(list(object({
      permission = string
      team_id    = optional(string)
      user_id    = optional(string)
    })), [])
  }))
  default = []
}

variable "grafana_service_account_permission_item" {
  type = list(object({
    org_id             = optional(string)
    service_account_id = string
    permission         = string
    team               = optional(string)
    user               = optional(string)
  }))
  default = []
}

variable "grafana_service_account_token" {
  type = map(object({
    service_account_id = string
    name               = string
    seconds_to_live    = optional(number)
  }))
  default = {}
}

variable "grafana_organization_preferences" {
  type = list(object({
    home_dashboard_uid = optional(string)
    theme              = optional(string)
    timezone           = optional(string)
    week_start         = optional(string)
    org_id             = string
  }))
  default = []
}

variable "grafana_annotation" {
  type = list(object({
    text          = string
    dashboard_uid = optional(string)
    org_id        = optional(string)
    panel_id      = optional(number)
    tags          = optional(set(string))
    time          = optional(string)
    time_end      = optional(string)
  }))
  default = []
}

variable "grafana_dashboard_public" {
  type = list(object({
    dashboard_uid          = string
    access_token           = optional(string)
    annotations_enabled    = optional(bool)
    is_enabled             = optional(bool)
    org_id                 = optional(string)
    share                  = optional(string)
    time_selection_enabled = optional(bool)
    uid                    = optional(string)
  }))
  default = []
}

variable "grafana_data_source_config" {
  type = list(object({
    http_headers             = optional(map(string))
    json_data_encoded        = optional(string)
    org_id                   = optional(string)
    secure_json_data_encoded = optional(string)
    uid                      = string
  }))
  default = []
}

variable "grafana_library_panel" {
  type = list(object({
    http_headers             = optional(map(string))
    json_data_encoded        = optional(string)
    org_id                   = optional(string)
    secure_json_data_encoded = optional(string)
    uid                      = string
  }))
  default = []
}

variable "grafana_playlist" {
  type = list(object({
    name     = string
    interval = string
    org_id   = optional(string)

    item = list(object({
      order = number
      title = string
      type  = optional(string)
      value = optional(string)
    }))
  }))
  default = []
}

variable "grafana_dashboard_permission" {
  type = list(object({
    dashboard_uid = string
    org_id        = optional(string)

    permissions = optional(list(object({
      permission = string
      role       = optional(string)
      team_id    = optional(string)
      user_id    = optional(string)
    })), [])
  }))
  default = []
}

variable "grafana_folder_permission" {
  type = list(object({
    folder_uid = string
    org_id     = optional(string)

    permissions = optional(list(object({
      permission = string
      role       = optional(string)
      team_id    = optional(string)
      user_id    = optional(string)
    })), [])
  }))
  default = []
}

variable "grafana_folder" {
  type = list(object({
    title                        = string
    uid                          = optional(string)
    org_id                       = optional(string)
    parent_folder_uid            = optional(string)
    prevent_destroy_if_not_empty = optional(bool)
  }))
  default = []
}

variable "grafana_user" {
  type = map(object({
    email    = string
    password = string
    login    = optional(string)
    is_admin = optional(bool)
    name     = optional(string)
  }))
  default = {}
}

variable "grafana_team" {
  type = list(object({
    name                             = string
    email                            = optional(string)
    ignore_externally_synced_members = optional(bool)
    members                          = optional(set(string))
    org_id                           = optional(string)
    preferences_home_dashboard_uid   = optional(string)
    preferences_theme                = optional(string)
    preferences_timezone             = optional(string)
    preferences_week_start           = optional(string)
    team_sync_groups                 = optional(set(string))
  }))
  default = []
}

variable "grafana_folder_permission_item" {
  type = list(object({
    folder_uid = string
    team       = optional(string)
    permission = string
    user       = optional(string)
    role       = optional(string)
    org_id     = optional(string)
  }))
  default = []
}

variable "grafana_organization" {
  type = map(object({
    admin_user           = optional(string)
    create_users         = optional(bool)
    admins               = optional(set(string))
    editors              = optional(set(string))
    viewers              = optional(set(string))
    users_without_access = optional(set(string))
  }))
  default = {}
}

variable "grafana_dashboard" {
  type = list(object({
    dashboards_path = string
    config_json     = string
    folder          = string
    message         = optional(string)
    org_id          = optional(string)
    overwrite       = optional(string)
  }))
  default = []
}

variable "grafana_sso_settings" {
  type = map(object({

    oauth2_settings = optional(object({
      client_id                  = string
      client_secret              = optional(string)
      allow_assign_grafana_admin = optional(bool)
      allow_sign_up              = optional(bool)
      allowed_domains            = optional(string)
      allowed_groups             = optional(string)
      allowed_organizations      = optional(string)
      api_url                    = optional(string)
      auth_style                 = optional(string)
      auth_url                   = optional(string)
      token_url                  = optional(string)
      auto_login                 = optional(bool)
      custom                     = optional(map(string))
      define_allowed_groups      = optional(bool)
      define_allowed_teams_ids   = optional(bool)
      email_attribute_name       = optional(string)
      email_attribute_path       = optional(string)
      login_attribute_path       = optional(string)
      name_attribute_path        = optional(string)
      id_token_attribute_name    = optional(string)
      empty_scopes               = optional(bool)
      enabled                    = optional(bool)
      groups_attribute_path      = optional(string)
      org_attribute_path         = optional(string)
      org_mapping                = optional(string)
      role_attribute_path        = optional(string)
      role_attribute_strict      = optional(bool)
      scopes                     = optional(string)
      signout_redirect_url       = optional(string)
      skip_org_role_sync         = optional(bool)
      team_ids                   = optional(string)
      team_ids_attribute_path    = optional(string)
      teams_url                  = optional(string)
      tls_client_ca              = optional(string)
      tls_client_cert            = optional(string)
      tls_client_key             = optional(string)
      tls_skip_verify_insecure   = optional(bool)
      use_pkce                   = optional(bool)
      use_refresh_token          = optional(bool)
    }), null)

    saml_settings = optional(object({
      enabled                    = optional(bool)
      allow_idp_initiated        = optional(bool)
      allow_sign_up              = optional(bool)
      allowed_organizations      = optional(string)
      auto_login                 = optional(bool)
      entity_id                  = optional(string)
      idp_metadata               = optional(string)
      idp_metadata_path          = optional(string)
      idp_metadata_url           = optional(string)
      max_issue_delay            = optional(string)
      metadata_valid_duration    = optional(string)
      name                       = optional(string)
      name_id_format             = optional(string)
      org_mapping                = optional(string)
      certificate                = optional(string)
      certificate_path           = optional(string)
      private_key                = optional(string)
      private_key_path           = optional(string)
      relay_state                = optional(string)
      assertion_attribute_email  = optional(string)
      assertion_attribute_groups = optional(string)
      assertion_attribute_login  = optional(string)
      assertion_attribute_name   = optional(string)
      assertion_attribute_org    = optional(string)
      assertion_attribute_role   = optional(string)
      role_values_admin          = optional(string)
      role_values_editor         = optional(string)
      role_values_grafana_admin  = optional(string)
      role_values_none           = optional(string)
      role_values_viewer         = optional(string)
      force_use_graph_api        = optional(bool)
      signature_algorithm        = optional(string)
      single_logout              = optional(bool)
      skip_org_role_sync         = optional(bool)
      client_id                  = optional(string)
      client_secret              = optional(string)
      token_url                  = optional(string)
    }), null)

    ldap_settings = optional(object({
      allow_sign_up      = optional(bool)
      enabled            = optional(bool)
      skip_org_role_sync = optional(bool)

      servers = optional(list(object({
        host                               = string
        search_base_dns                    = list(string)
        search_filter                      = string
        attributes                         = optional(map(string))
        bind_dn                            = optional(string)
        bind_password                      = optional(string)
        client_cert                        = optional(string)
        client_cert_value                  = optional(string)
        client_key                         = optional(string)
        client_key_value                   = optional(string)
        group_search_base_dns              = optional(list(string))
        group_search_filter                = optional(string)
        group_search_filter_user_attribute = optional(string)
        min_tls_version                    = optional(string)
        port                               = optional(number)
        root_ca_cert                       = optional(string)
        root_ca_cert_value                 = optional(list(string))
        ssl_skip_verify                    = optional(bool)
        start_tls                          = optional(bool)
        timeout                            = optional(number)
        tls_ciphers                        = optional(list(string))
        use_ssl                            = optional(bool)

        group_mappings = optional(list(object({
          group_dn      = string
          org_role      = string
          grafana_admin = optional(bool)
          org_id        = optional(number)
        })), [])
      })), [])
    }), null)
  }))
  default = {}
}
