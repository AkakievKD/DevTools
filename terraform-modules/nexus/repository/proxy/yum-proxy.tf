resource "nexus_repository_yum_proxy" "nexus_repository_yum_proxy" {
  for_each = { for key, value in var.nexus_repository_yum_proxy : key => value }

  name         = each.key
  online       = each.value.online
  routing_rule = each.value.routing_rule

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

  yum_signing {
    keypair    = each.value.yum_signing_keypair
    passphrase = each.value.yum_signing_passphrase
  }
}
