resource "nexus_repository_docker_proxy" "repository_docker_proxy" {
  for_each = { for key, value in var.nexus_repository_docker_proxy : key => value }

  name         = each.key
  online       = each.value.online
  routing_rule = each.value.routing_rule

  docker {
    force_basic_auth = each.value.docker_force_basic_auth
    v1_enabled       = each.value.docker_v1_enabled
    http_port        = each.value.docker_http_port
    https_port       = each.value.docker_https_port
    subdomain        = each.value.docker_subdomain
  }

  docker_proxy {
    index_type                  = each.value.docker_proxy_index_url
    cache_foreign_layers        = each.value.docker_proxy_cache_foreign_layers
    foreign_layer_url_whitelist = each.value.docker_proxy_foreign_layer_url_whitelist
    index_url                   = each.value.docker_proxy_index_url
  }

  http_client {
    auto_block = each.value.http_client_auto_block
    blocked    = each.value.http_client_blocked

    dynamic "authentication" {
      for_each = can(each.value.authentication) && each.value.authentication != null ? [each.value.authentication] : []
      content {
        type        = authentication.value.type
        username    = authentication.value.username
        password    = authentication.value.password
        ntlm_domain = authentication.value.ntlm_domain
        ntlm_host   = authentication.value.ntlm_host
      }
    }

    dynamic "connection" {
      for_each = can(each.value.connection) && each.value.connection != null ? [each.value.connection] : []
      content {
        enable_circular_redirects = connection.value.enable_circular_redirects
        enable_cookies            = connection.value.enable_cookies
        retries                   = connection.value.retries
        timeout                   = connection.value.timeout
        use_trust_store           = connection.value.use_trust_store
        user_agent_suffix         = connection.value.user_agent_suffix
      }
    }
  }

  negative_cache {
    enabled = each.value.negative_cache_enabled
    ttl     = each.value.negative_cache_ttl
  }

  proxy {
    remote_url       = each.value.proxy_remote_url
    content_max_age  = each.value.proxy_content_max_age
    metadata_max_age = each.value.proxy_metadata_max_age
  }

  storage {
    blob_store_name                = each.value.storage_blob_store_name
    strict_content_type_validation = each.value.storage_strict_content_type_validation
  }

  dynamic "cleanup" {
    for_each = each.value.cleanup
    content {
      policy_names = cleanup.value.policy_names
    }
  }
}
