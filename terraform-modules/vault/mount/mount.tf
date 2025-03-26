resource "vault_mount" "mount" {
  for_each = var.vault_mount

  namespace                    = each.value.namespace
  path                         = each.value.path
  type                         = each.value.type
  description                  = each.value.description
  default_lease_ttl_seconds    = each.value.default_lease_ttl_seconds
  max_lease_ttl_seconds        = each.value.max_lease_ttl_seconds
  audit_non_hmac_response_keys = each.value.audit_non_hmac_response_keys
  audit_non_hmac_request_keys  = each.value.audit_non_hmac_request_keys
  local                        = each.value.local
  options                      = each.value.options
  seal_wrap                    = each.value.seal_wrap
  external_entropy_access      = each.value.external_entropy_access
  allowed_managed_keys         = each.value.allowed_managed_keys
  listing_visibility           = each.value.listing_visibility
  passthrough_request_headers  = each.value.passthrough_request_headers
  allowed_response_headers     = each.value.allowed_response_headers
  delegated_auth_accessors     = each.value.delegated_auth_accessors
  plugin_version               = each.value.plugin_version
  identity_token_key           = each.value.identity_token_key
}
