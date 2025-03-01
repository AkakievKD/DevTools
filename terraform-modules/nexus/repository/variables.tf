variable "nexus_repository_apt_hosted" {
  type = map(object({
    distribution                           = string
    online                                 = optional(bool)
    signin_gkeypair                        = string
    signing_passphrase                     = optional(string)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    storage_write_policy                   = optional(string)

    cleanup = optional(list(object({
      policy_names = optional(set(string))
    })), [])

    component = optional(object({
      proprietary_components = string
    }), null)
  }))
  default = {}
}

variable "nexus_repository_docker_hosted" {
  type = map(object({
    online                                 = optional(bool)
    docker_force_basic_auth                = bool
    docker_v1_enabled                      = bool
    docker_http_port                       = optional(number)
    docker_https_port                      = optional(number)
    docker_subdomain                       = optional(string)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    storage_write_policy                   = optional(string)
    storage_latest_policy                  = optional(bool)

    cleanup = optional(list(object({
      policy_names = optional(set(string))
    })), [])

    component = optional(object({
      proprietary_components = string
    }), null)
  }))
  default = {}
}

variable "nexus_repository_gitlfs_hosted" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    storage_write_policy                   = optional(string)

    cleanup = optional(list(object({
      policy_names = optional(set(string))
    })), [])

    component = optional(object({
      proprietary_components = string
    }), null)
  }))
  default = {}
}

variable "nexus_repository_helm_hosted" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    storage_write_policy                   = optional(string)

    cleanup = optional(list(object({
      policy_names = optional(set(string))
    })), [])

    component = optional(object({
      proprietary_components = string
    }), null)
  }))
  default = {}
}

variable "nexus_repository_maven_hosted" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    storage_write_policy                   = optional(string)
    maven_layout_policy                    = string
    maven_version_policy                   = string
    maven_content_disposition              = optional(string)

    cleanup = optional(list(object({
      policy_names = optional(set(string))
    })), [])

    component = optional(object({
      proprietary_components = string
    }), null)
  }))
  default = {}
}

variable "nexus_repository_npm_hosted" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    storage_write_policy                   = optional(string)

    cleanup = optional(list(object({
      policy_names = optional(set(string))
    })), [])

    component = optional(object({
      proprietary_components = string
    }), null)
  }))
  default = {}
}

variable "nexus_repository_nuget_hosted" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    storage_write_policy                   = optional(string)

    cleanup = optional(list(object({
      policy_names = optional(set(string))
    })), [])

    component = optional(object({
      proprietary_components = string
    }), null)
  }))
  default = {}
}

variable "nexus_repository_pypi_hosted" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    storage_write_policy                   = optional(string)

    cleanup = optional(list(object({
      policy_names = optional(set(string))
    })), [])

    component = optional(object({
      proprietary_components = string
    }), null)
  }))
  default = {}
}

variable "nexus_repository_r_hosted" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    storage_write_policy                   = optional(string)

    cleanup = optional(list(object({
      policy_names = optional(set(string))
    })), [])

    component = optional(object({
      proprietary_components = string
    }), null)
  }))
  default = {}
}

variable "nexus_repository_raw_hosted" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    storage_write_policy                   = optional(string)

    cleanup = optional(list(object({
      policy_names = optional(set(string))
    })), [])

    component = optional(object({
      proprietary_components = string
    }), null)
  }))
  default = {}
}

variable "nexus_repository_rubygems_hosted" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    storage_write_policy                   = optional(string)

    cleanup = optional(list(object({
      policy_names = optional(set(string))
    })), [])

    component = optional(object({
      proprietary_components = string
    }), null)
  }))
  default = {}
}

variable "nexus_repository_yum_hosted" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    storage_write_policy                   = optional(string)
    deploy_policy                          = optional(string)
    repodata_depth                         = optional(number)

    cleanup = optional(list(object({
      policy_names = optional(set(string))
    })), [])

    component = optional(object({
      proprietary_components = string
    }), null)
  }))
  default = {}
}

variable "nexus_repository_apt_proxy" {
  type = map(object({
    online                                 = optional(bool)
    distribution                           = string
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    flat                                   = bool
    routing_rule                           = optional(string)
    http_client_auto_block                 = bool
    http_client_blocked                    = bool
    negative_cache_enabled                 = bool
    negative_cache_ttl                     = number
    proxy_remote_url                       = string
    proxy_content_max_age                  = optional(number)
    proxy_metadata_max_age                 = optional(number)

    cleanup = optional(list(object({
      policy_names = optional(set(string))
    })), [])

    authentication = optional(object({
      type        = string
      username    = optional(string)
      password    = optional(string)
      ntlm_domain = optional(string)
      ntlm_host   = optional(string)
    }), null)

    connection = optional(object({
      enable_circular_redirects = optional(bool)
      enable_cookies            = optional(bool)
      retries                   = optional(number)
      timeout                   = optional(number)
      use_trust_store           = optional(bool)
      user_agent_suffix         = optional(string)
    }), null)
  }))
  default = {}
}

variable "nexus_repository_conan_proxy" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    routing_rule                           = optional(string)
    http_client_auto_block                 = bool
    http_client_blocked                    = bool
    negative_cache_enabled                 = bool
    negative_cache_ttl                     = number
    proxy_remote_url                       = string
    proxy_content_max_age                  = optional(number)
    proxy_metadata_max_age                 = optional(number)

    cleanup = optional(list(object({
      policy_names = optional(set(string))
    })), [])

    authentication = optional(object({
      type        = string
      username    = optional(string)
      password    = optional(string)
      ntlm_domain = optional(string)
      ntlm_host   = optional(string)
    }), null)

    connection = optional(object({
      enable_circular_redirects = optional(bool)
      enable_cookies            = optional(bool)
      retries                   = optional(number)
      timeout                   = optional(number)
      use_trust_store           = optional(bool)
      user_agent_suffix         = optional(string)
    }), null)
  }))
  default = {}
}

variable "nexus_repository_cocoapods_proxy" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    routing_rule                           = optional(string)
    http_client_auto_block                 = bool
    http_client_blocked                    = bool
    negative_cache_enabled                 = bool
    negative_cache_ttl                     = number
    proxy_remote_url                       = string
    proxy_content_max_age                  = optional(number)
    proxy_metadata_max_age                 = optional(number)

    cleanup = optional(list(object({
      policy_names = optional(set(string))
    })), [])

    authentication = optional(object({
      type        = string
      username    = optional(string)
      password    = optional(string)
      ntlm_domain = optional(string)
      ntlm_host   = optional(string)
    }), null)

    connection = optional(object({
      enable_circular_redirects = optional(bool)
      enable_cookies            = optional(bool)
      retries                   = optional(number)
      timeout                   = optional(number)
      use_trust_store           = optional(bool)
      user_agent_suffix         = optional(string)
    }), null)
  }))
  default = {}
}

variable "nexus_repository_conda_proxy" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    routing_rule                           = optional(string)
    http_client_auto_block                 = bool
    http_client_blocked                    = bool
    negative_cache_enabled                 = bool
    negative_cache_ttl                     = number
    proxy_remote_url                       = string
    proxy_content_max_age                  = optional(number)
    proxy_metadata_max_age                 = optional(number)

    cleanup = optional(list(object({
      policy_names = optional(set(string))
    })), [])

    authentication = optional(object({
      type        = string
      username    = optional(string)
      password    = optional(string)
      ntlm_domain = optional(string)
      ntlm_host   = optional(string)
    }), null)

    connection = optional(object({
      enable_circular_redirects = optional(bool)
      enable_cookies            = optional(bool)
      retries                   = optional(number)
      timeout                   = optional(number)
      use_trust_store           = optional(bool)
      user_agent_suffix         = optional(string)
    }), null)
  }))
  default = {}
}

variable "nexus_repository_docker_proxy" {
  type = map(object({
    online                                   = optional(bool)
    storage_blob_store_name                  = string
    storage_strict_content_type_validation   = bool
    routing_rule                             = optional(string)
    http_client_auto_block                   = bool
    http_client_blocked                      = bool
    negative_cache_enabled                   = bool
    negative_cache_ttl                       = number
    proxy_remote_url                         = string
    proxy_content_max_age                    = optional(number)
    proxy_metadata_max_age                   = optional(number)
    docker_proxy_index_type                  = string
    docker_proxy_cache_foreign_layers        = optional(bool)
    docker_proxy_foreign_layer_url_whitelist = optional(set(string))
    docker_proxy_index_url                   = optional(string)
    docker_force_basic_auth                  = bool
    docker_v1_enabled                        = bool
    docker_http_port                         = optional(number)
    docker_https_port                        = optional(number)
    docker_subdomain                         = optional(string)

    cleanup = optional(list(object({
      policy_names = optional(set(string))
    })), [])

    authentication = optional(object({
      type        = string
      username    = optional(string)
      password    = optional(string)
      ntlm_domain = optional(string)
      ntlm_host   = optional(string)
    }), null)

    connection = optional(object({
      enable_circular_redirects = optional(bool)
      enable_cookies            = optional(bool)
      retries                   = optional(number)
      timeout                   = optional(number)
      use_trust_store           = optional(bool)
      user_agent_suffix         = optional(string)
    }), null)
  }))
  default = {}
}

variable "nexus_repository_go_proxy" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    routing_rule                           = optional(string)
    http_client_auto_block                 = bool
    http_client_blocked                    = bool
    negative_cache_enabled                 = bool
    negative_cache_ttl                     = number
    proxy_remote_url                       = string
    proxy_content_max_age                  = optional(number)
    proxy_metadata_max_age                 = optional(number)

    cleanup = optional(list(object({
      policy_names = optional(set(string))
    })), [])

    authentication = optional(object({
      type        = string
      username    = optional(string)
      password    = optional(string)
      ntlm_domain = optional(string)
      ntlm_host   = optional(string)
      preemptive  = optional(bool)
    }), null)

    connection = optional(object({
      enable_circular_redirects = optional(bool)
      enable_cookies            = optional(bool)
      retries                   = optional(number)
      timeout                   = optional(number)
      use_trust_store           = optional(bool)
      user_agent_suffix         = optional(string)
    }), null)
  }))
  default = {}
}

variable "nexus_repository_helm_proxy" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    routing_rule                           = optional(string)
    http_client_auto_block                 = bool
    http_client_blocked                    = bool
    negative_cache_enabled                 = bool
    negative_cache_ttl                     = number
    proxy_remote_url                       = string
    proxy_content_max_age                  = optional(number)
    proxy_metadata_max_age                 = optional(number)

    cleanup = optional(list(object({
      policy_names = optional(set(string))
    })), [])

    authentication = optional(object({
      type        = string
      username    = optional(string)
      password    = optional(string)
      ntlm_domain = optional(string)
      ntlm_host   = optional(string)
      preemptive  = optional(bool)
    }), null)

    connection = optional(object({
      enable_circular_redirects = optional(bool)
      enable_cookies            = optional(bool)
      retries                   = optional(number)
      timeout                   = optional(number)
      use_trust_store           = optional(bool)
      user_agent_suffix         = optional(string)
    }), null)
  }))
  default = {}
}

variable "nexus_repository_maven_proxy" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    routing_rule                           = optional(string)
    http_client_auto_block                 = bool
    http_client_blocked                    = bool
    negative_cache_enabled                 = bool
    negative_cache_ttl                     = number
    proxy_remote_url                       = string
    proxy_content_max_age                  = optional(number)
    proxy_metadata_max_age                 = optional(number)
    maven_layout_policy                    = string
    maven_version_policy                   = string
    maven_content_disposition              = optional(string)

    cleanup = optional(list(object({
      policy_names = optional(set(string))
    })), [])

    authentication = optional(object({
      type        = string
      username    = optional(string)
      password    = optional(string)
      ntlm_domain = optional(string)
      ntlm_host   = optional(string)
      preemptive  = optional(bool)
    }), null)

    connection = optional(object({
      enable_circular_redirects = optional(bool)
      enable_cookies            = optional(bool)
      retries                   = optional(number)
      timeout                   = optional(number)
      use_trust_store           = optional(bool)
      user_agent_suffix         = optional(string)
    }), null)
  }))
  default = {}
}

variable "nexus_repository_npm_proxy" {
  type = map(object({
    online                                 = optional(bool)
    remove_quarantined                     = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    routing_rule                           = optional(string)
    http_client_auto_block                 = bool
    http_client_blocked                    = bool
    negative_cache_enabled                 = bool
    negative_cache_ttl                     = number
    proxy_remote_url                       = string
    proxy_content_max_age                  = optional(number)
    proxy_metadata_max_age                 = optional(number)

    cleanup = optional(list(object({
      policy_names = optional(set(string))
    })), [])

    authentication = optional(object({
      type        = string
      username    = optional(string)
      password    = optional(string)
      ntlm_domain = optional(string)
      ntlm_host   = optional(string)
    }), null)

    connection = optional(object({
      enable_circular_redirects = optional(bool)
      enable_cookies            = optional(bool)
      retries                   = optional(number)
      timeout                   = optional(number)
      use_trust_store           = optional(bool)
      user_agent_suffix         = optional(string)
    }), null)
  }))
  default = {}
}

variable "nexus_repository_nuget_proxy" {
  type = map(object({
    online                                 = optional(bool)
    nuget_version                          = string
    query_cache_item_max_age               = number
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    routing_rule                           = optional(string)
    http_client_auto_block                 = bool
    http_client_blocked                    = bool
    negative_cache_enabled                 = bool
    negative_cache_ttl                     = number
    proxy_remote_url                       = string
    proxy_content_max_age                  = optional(number)
    proxy_metadata_max_age                 = optional(number)

    cleanup = optional(list(object({
      policy_names = optional(set(string))
    })), [])

    authentication = optional(object({
      type        = string
      username    = optional(string)
      password    = optional(string)
      ntlm_domain = optional(string)
      ntlm_host   = optional(string)
      preemptive  = optional(bool)
    }), null)

    connection = optional(object({
      enable_circular_redirects = optional(bool)
      enable_cookies            = optional(bool)
      retries                   = optional(number)
      timeout                   = optional(number)
      use_trust_store           = optional(bool)
      user_agent_suffix         = optional(string)
    }), null)
  }))
  default = {}
}

variable "nexus_repository_p2_proxy" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    routing_rule                           = optional(string)
    http_client_auto_block                 = bool
    http_client_blocked                    = bool
    negative_cache_enabled                 = bool
    negative_cache_ttl                     = number
    proxy_remote_url                       = string
    proxy_content_max_age                  = optional(number)
    proxy_metadata_max_age                 = optional(number)

    cleanup = optional(list(object({
      policy_names = optional(set(string))
    })), [])

    authentication = optional(object({
      type        = string
      username    = optional(string)
      password    = optional(string)
      ntlm_domain = optional(string)
      ntlm_host   = optional(string)
    }), null)

    connection = optional(object({
      enable_circular_redirects = optional(bool)
      enable_cookies            = optional(bool)
      retries                   = optional(number)
      timeout                   = optional(number)
      use_trust_store           = optional(bool)
      user_agent_suffix         = optional(string)
    }), null)
  }))
  default = {}
}

variable "nexus_repository_pypi_proxy" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    routing_rule                           = optional(string)
    http_client_auto_block                 = bool
    http_client_blocked                    = bool
    negative_cache_enabled                 = bool
    negative_cache_ttl                     = number
    proxy_remote_url                       = string
    proxy_content_max_age                  = optional(number)
    proxy_metadata_max_age                 = optional(number)

    cleanup = optional(list(object({
      policy_names = optional(set(string))
    })), [])

    authentication = optional(object({
      type        = string
      username    = optional(string)
      password    = optional(string)
      ntlm_domain = optional(string)
      ntlm_host   = optional(string)
    }), null)

    connection = optional(object({
      enable_circular_redirects = optional(bool)
      enable_cookies            = optional(bool)
      retries                   = optional(number)
      timeout                   = optional(number)
      use_trust_store           = optional(bool)
      user_agent_suffix         = optional(string)
    }), null)
  }))
  default = {}
}

variable "nexus_repository_r_proxy" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    routing_rule                           = optional(string)
    http_client_auto_block                 = bool
    http_client_blocked                    = bool
    negative_cache_enabled                 = bool
    negative_cache_ttl                     = number
    proxy_remote_url                       = string
    proxy_content_max_age                  = optional(number)
    proxy_metadata_max_age                 = optional(number)

    cleanup = optional(list(object({
      policy_names = optional(set(string))
    })), [])

    authentication = optional(object({
      type        = string
      username    = optional(string)
      password    = optional(string)
      ntlm_domain = optional(string)
      ntlm_host   = optional(string)
    }), null)

    connection = optional(object({
      enable_circular_redirects = optional(bool)
      enable_cookies            = optional(bool)
      retries                   = optional(number)
      timeout                   = optional(number)
      use_trust_store           = optional(bool)
      user_agent_suffix         = optional(string)
    }), null)
  }))
  default = {}
}

variable "nexus_repository_raw_proxy" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    routing_rule                           = optional(string)
    http_client_auto_block                 = bool
    http_client_blocked                    = bool
    negative_cache_enabled                 = bool
    negative_cache_ttl                     = number
    proxy_remote_url                       = string
    proxy_content_max_age                  = optional(number)
    proxy_metadata_max_age                 = optional(number)

    cleanup = optional(list(object({
      policy_names = optional(set(string))
    })), [])

    authentication = optional(object({
      type        = string
      username    = optional(string)
      password    = optional(string)
      ntlm_domain = optional(string)
      ntlm_host   = optional(string)
      preemptive  = optional(bool)
    }), null)

    connection = optional(object({
      enable_circular_redirects = optional(bool)
      enable_cookies            = optional(bool)
      retries                   = optional(number)
      timeout                   = optional(number)
      use_trust_store           = optional(bool)
      user_agent_suffix         = optional(string)
    }), null)
  }))
  default = {}
}

variable "nexus_repository_rubygems_proxy" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    routing_rule                           = optional(string)
    http_client_auto_block                 = bool
    http_client_blocked                    = bool
    negative_cache_enabled                 = bool
    negative_cache_ttl                     = number
    proxy_remote_url                       = string
    proxy_content_max_age                  = optional(number)
    proxy_metadata_max_age                 = optional(number)

    cleanup = optional(list(object({
      policy_names = optional(set(string))
    })), [])

    authentication = optional(object({
      type        = string
      username    = optional(string)
      password    = optional(string)
      ntlm_domain = optional(string)
      ntlm_host   = optional(string)
    }), null)

    connection = optional(object({
      enable_circular_redirects = optional(bool)
      enable_cookies            = optional(bool)
      retries                   = optional(number)
      timeout                   = optional(number)
      use_trust_store           = optional(bool)
      user_agent_suffix         = optional(string)
    }), null)
  }))
  default = {}
}

variable "nexus_repository_yum_proxy" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    routing_rule                           = optional(string)
    http_client_auto_block                 = bool
    http_client_blocked                    = bool
    negative_cache_enabled                 = bool
    negative_cache_ttl                     = number
    proxy_remote_url                       = string
    proxy_content_max_age                  = optional(number)
    proxy_metadata_max_age                 = optional(number)
    yum_signing_keypair                    = string
    yum_signing_passphrase                 = optional(string)

    cleanup = optional(list(object({
      policy_names = optional(set(string))
    })), [])

    authentication = optional(object({
      type        = string
      username    = optional(string)
      password    = optional(string)
      ntlm_domain = optional(string)
      ntlm_host   = optional(string)
    }), null)

    connection = optional(object({
      enable_circular_redirects = optional(bool)
      enable_cookies            = optional(bool)
      retries                   = optional(number)
      timeout                   = optional(number)
      use_trust_store           = optional(bool)
      user_agent_suffix         = optional(string)
    }), null)
  }))
  default = {}
}

variable "nexus_repository_docker_group" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    docker_force_basic_auth                = bool
    docker_v1_enabled                      = bool
    docker_http_port                       = optional(number)
    docker_https_port                      = optional(number)
    docker_subdomain                       = optional(string)
    group_member_names                     = list(string)
    group_writable_member                  = string
  }))
  default = {}
}

variable "nexus_repository_go_group" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    group_member_names                     = list(string)
  }))
  default = {}
}

variable "nexus_repository_maven_group" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    group_member_names                     = list(string)
  }))
  default = {}
}

variable "nexus_repository_npm_group" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    group_member_names                     = list(string)
    group_writable_member                  = string
  }))
  default = {}
}

variable "nexus_repository_nuget_group" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    group_member_names                     = list(string)
  }))
  default = {}
}

variable "nexus_repository_pypi_group" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    group_member_names                     = list(string)
  }))
  default = {}
}

variable "nexus_repository_r_group" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    group_member_names                     = list(string)
  }))
  default = {}
}

variable "nexus_repository_raw_group" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    group_member_names                     = list(string)
  }))
  default = {}
}

variable "nexus_repository_rubygems_group" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    group_member_names                     = list(string)
  }))
  default = {}
}

variable "nexus_repository_yum_group" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    group_member_names                     = list(string)
    yum_signing_keypair                    = string
    yum_signing_passphrase                 = optional(string)
  }))
  default = {}
}
