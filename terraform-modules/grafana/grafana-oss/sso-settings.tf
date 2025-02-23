resource "grafana_sso_settings" "sso_settings" {
  count = var.grafana_sso_settings == null ? 0 : 1

  provider_name = var.grafana_sso_settings.provider_name

  dynamic "ldap_settings" {
    for_each = can(var.grafana_sso_settings.ldap_settings) && var.grafana_sso_settings.ldap_settings != null ? [var.grafana_sso_settings.ldap_settings] : []
    content {
      allow_sign_up      = ldap_settings.value.allow_sign_up
      enabled            = ldap_settings.value.enabled
      skip_org_role_sync = ldap_settings.value.skip_org_role_sync

      config {
        dynamic "servers" {
          for_each = ldap_settings.value.servers
          content {
            host                               = servers.value.host
            port                               = servers.value.port
            use_ssl                            = servers.value.use_ssl
            start_tls                          = servers.value.start_tls
            ssl_skip_verify                    = servers.value.ssl_skip_verify
            timeout                            = servers.value.timeout
            min_tls_version                    = servers.value.min_tls_version
            tls_ciphers                        = servers.value.tls_ciphers
            root_ca_cert                       = servers.value.root_ca_cert
            root_ca_cert_value                 = servers.value.root_ca_cert_value
            search_base_dns                    = servers.value.search_base_dns
            search_filter                      = servers.value.search_filter
            bind_dn                            = servers.value.bind_dn
            bind_password                      = servers.value.bind_password
            attributes                         = servers.value.attributes
            group_search_base_dns              = servers.value.group_search_base_dns
            group_search_filter                = servers.value.group_search_filter
            group_search_filter_user_attribute = servers.value.group_search_filter_user_attribute
            client_cert                        = servers.value.client_cert
            client_cert_value                  = servers.value.client_cert_value
            client_key                         = servers.value.client_key
            client_key_value                   = servers.value.client_key_value

            dynamic "group_mappings" {
              for_each = servers.value.group_mappings
              content {
                group_dn      = group_mappings.value.group_dn
                org_role      = group_mappings.value.org_role
                grafana_admin = group_mappings.value.grafana_admin
                org_id        = group_mappings.value.org_id
              }
            }
          }
        }
      }
    }
  }

  dynamic "oauth2_settings" {
    for_each = can(var.grafana_sso_settings.oauth2_settings) && var.grafana_sso_settings.oauth2_settings != null ? [var.grafana_sso_settings.oauth2_settings] : []
    content {
      client_id                  = oauth2_settings.value.client_id
      client_secret              = oauth2_settings.value.client_secret
      allow_assign_grafana_admin = oauth2_settings.value.allow_assign_grafana_admin
      allow_sign_up              = oauth2_settings.value.allow_sign_up
      allowed_domains            = oauth2_settings.value.allowed_domains
      allowed_groups             = oauth2_settings.value.allowed_groups
      allowed_organizations      = oauth2_settings.value.allowed_organizations
      api_url                    = oauth2_settings.value.api_url
      auth_style                 = oauth2_settings.value.auth_style
      auth_url                   = oauth2_settings.value.auth_url
      token_url                  = oauth2_settings.value.token_url
      auto_login                 = oauth2_settings.value.auto_login
      custom                     = oauth2_settings.value.custom
      define_allowed_groups      = oauth2_settings.value.define_allowed_groups
      define_allowed_teams_ids   = oauth2_settings.value.define_allowed_teams_ids
      email_attribute_name       = oauth2_settings.value.email_attribute_name
      email_attribute_path       = oauth2_settings.value.email_attribute_path
      login_attribute_path       = oauth2_settings.value.login_attribute_path
      name_attribute_path        = oauth2_settings.value.name_attribute_path
      id_token_attribute_name    = oauth2_settings.value.id_token_attribute_name
      empty_scopes               = oauth2_settings.value.empty_scopes
      enabled                    = oauth2_settings.value.enabled
      groups_attribute_path      = oauth2_settings.value.groups_attribute_path
      org_attribute_path         = oauth2_settings.value.org_attribute_path
      org_mapping                = oauth2_settings.value.org_mapping
      role_attribute_path        = oauth2_settings.value.role_attribute_path
      role_attribute_strict      = oauth2_settings.value.role_attribute_strict
      scopes                     = oauth2_settings.value.scopes
      signout_redirect_url       = oauth2_settings.value.signout_redirect_url
      skip_org_role_sync         = oauth2_settings.value.skip_org_role_sync
      team_ids                   = oauth2_settings.value.team_ids
      team_ids_attribute_path    = oauth2_settings.value.team_ids_attribute_path
      teams_url                  = oauth2_settings.value.teams_url
      tls_client_ca              = oauth2_settings.value.tls_client_ca
      tls_client_cert            = oauth2_settings.value.tls_client_cert
      tls_client_key             = oauth2_settings.value.tls_client_key
      tls_skip_verify_insecure   = oauth2_settings.value.tls_skip_verify_insecure
      use_pkce                   = oauth2_settings.value.use_pkce
      use_refresh_token          = oauth2_settings.value.use_refresh_token
    }
  }

  dynamic "saml_settings" {
    for_each = can(var.grafana_sso_settings.saml_settings) && var.grafana_sso_settings.saml_settings != null ? [var.grafana_sso_settings.saml_settings] : []
    content {
      enabled                    = saml_settings.value.enabled
      allow_idp_initiated        = saml_settings.value.allow_idp_initiated
      allow_sign_up              = saml_settings.value.allow_sign_up
      allowed_organizations      = saml_settings.value.allowed_organizations
      auto_login                 = saml_settings.value.auto_login
      entity_id                  = saml_settings.value.entity_id
      idp_metadata               = saml_settings.value.idp_metadata
      idp_metadata_path          = saml_settings.value.idp_metadata_path
      idp_metadata_url           = saml_settings.value.idp_metadata_url
      max_issue_delay            = saml_settings.value.max_issue_delay
      metadata_valid_duration    = saml_settings.value.metadata_valid_duration
      name                       = saml_settings.value.name
      name_id_format             = saml_settings.value.name_id_format
      org_mapping                = saml_settings.value.org_mapping
      certificate                = saml_settings.value.certificate
      certificate_path           = saml_settings.value.certificate_path
      private_key                = saml_settings.value.private_key
      private_key_path           = saml_settings.value.private_key_path
      relay_state                = saml_settings.value.relay_state
      assertion_attribute_email  = saml_settings.value.assertion_attribute_email
      assertion_attribute_groups = saml_settings.value.assertion_attribute_groups
      assertion_attribute_login  = saml_settings.value.assertion_attribute_login
      assertion_attribute_name   = saml_settings.value.assertion_attribute_name
      assertion_attribute_org    = saml_settings.value.assertion_attribute_org
      assertion_attribute_role   = saml_settings.value.assertion_attribute_role
      role_values_admin          = saml_settings.value.role_values_admin
      role_values_editor         = saml_settings.value.role_values_editor
      role_values_grafana_admin  = saml_settings.value.role_values_grafana_admin
      role_values_none           = saml_settings.value.role_values_none
      role_values_viewer         = saml_settings.value.role_values_viewer
      force_use_graph_api        = saml_settings.value.force_use_graph_api
      signature_algorithm        = saml_settings.value.signature_algorithm
      single_logout              = saml_settings.value.single_logout
      skip_org_role_sync         = saml_settings.value.skip_org_role_sync
      client_id                  = saml_settings.value.client_id
      client_secret              = saml_settings.value.client_secret
      token_url                  = saml_settings.value.token_url
    }
  }
}
