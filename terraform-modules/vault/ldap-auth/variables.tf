variable "vault_ldap_auth_backend" {
  type = object({
    url                        = string
    namespace                  = optional(string)
    starttls                   = optional(bool)
    case_sensitive_names       = optional(bool)
    max_page_size              = optional(number)
    tls_min_version            = optional(string)
    tls_max_version            = optional(string)
    insecure_tls               = optional(bool)
    certificate                = optional(string)
    binddn                     = optional(string)
    bindpass                   = optional(string)
    userdn                     = optional(string)
    userattr                   = optional(string)
    userfilter                 = optional(string)
    upndomain                  = optional(string)
    discoverdn                 = optional(bool)
    deny_null_bind             = optional(bool)
    groupfilter                = optional(string)
    groupdn                    = optional(string)
    groupattr                  = optional(string)
    username_as_alias          = optional(bool)
    use_token_groups           = optional(bool)
    path                       = optional(string)
    disable_remount            = optional(bool)
    description                = optional(string)
    local                      = optional(bool)
    connection_timeout         = optional(number)
    rotation_period            = optional(number)
    rotation_schedule          = optional(string)
    rotation_window            = optional(number)
    disable_automated_rotation = optional(bool)
    token_ttl                  = optional(number)
    token_max_ttl              = optional(number)
    token_period               = optional(number)
    token_policies             = optional(set(string))
    token_bound_cidrs          = optional(set(string))
    token_explicit_max_ttl     = optional(number)
    token_no_default_policy    = optional(bool)
    token_num_uses             = optional(number)
    token_type                 = optional(string)
  })
  default = null
}

variable "vault_ldap_auth_backend_group" {
  type = map(object({
    namespace = optional(string)
    groupname = string
    policies  = optional(set(string))
    backend   = optional(string)
  }))
  default = {}
}

variable "vault_ldap_auth_backend_user" {
  type = map(object({
    namespace = optional(string)
    username  = string
    groups    = optional(string)
    policies  = optional(set(string))
    backend   = optional(string)
  }))
  default = {}
}
