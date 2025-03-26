variable "vault_mount" {
  type = map(object({
    path                         = string
    type                         = string
    namespace                    = optional(string)
    description                  = optional(string)
    default_lease_ttl_seconds    = optional(number)
    max_lease_ttl_seconds        = optional(number)
    audit_non_hmac_response_keys = optional(list(string))
    audit_non_hmac_request_keys  = optional(list(string))
    local                        = optional(bool)
    options                      = optional(map(string))
    seal_wrap                    = optional(bool)
    external_entropy_access      = optional(bool)
    allowed_managed_keys         = optional(set(string))
    listing_visibility           = optional(string)
    passthrough_request_headers  = optional(list(string))
    allowed_response_headers     = optional(list(string))
    delegated_auth_accessors     = optional(list(string))
    plugin_version               = optional(string)
    identity_token_key           = optional(string)
  }))
  default = {}
}
