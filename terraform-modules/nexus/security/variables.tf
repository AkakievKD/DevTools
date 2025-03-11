variable "nexus_security_ldap_order" {
  type = map(object({
    order = list(string)
  }))
  default = {}
}

variable "nexus_security_realms" {
  type = object({
    active = list(string)
  })
  default = null
}

variable "nexus_security_ldap" {
  type = map(object({
    auth_password                  = optional(string)
    auth_realm                     = optional(string)
    auth_schema                    = string
    group_type                     = string
    auth_username                  = string
    connection_retry_delay_seconds = number
    connection_timeout_seconds     = number
    group_base_dn                  = optional(string)
    group_id_attribute             = optional(string)
    group_member_attribute         = optional(string)
    group_member_format            = optional(string)
    group_object_class             = optional(string)
    group_subtree                  = optional(bool)
    use_trust_store                = optional(bool)
    host                           = string
    ldap_groups_as_roles           = optional(bool)
    max_incident_count             = number
    name                           = string
    port                           = number
    protocol                       = string
    search_base                    = string
    user_base_dn                   = optional(string)
    user_email_address_attribute   = optional(string)
    user_id_attribute              = optional(string)
    user_ldap_filter               = optional(string)
    user_member_of_attribute       = optional(string)
    user_object_class              = optional(string)
    user_password_attribute        = optional(string)
    user_real_name_attribute       = optional(string)
    user_subtree                   = optional(bool)
  }))
  default = {}
}

variable "nexus_security_user_token" {
  type = map(object({
    enabled            = bool
    protect_content    = optional(bool)
    expiration_days    = optional(number)
    expiration_enabled = optional(bool)
  }))
  default = {}
}

variable "nexus_security_anonymous" {
  type = map(object({
    enabled    = optional(bool)
    user_id    = string
    realm_name = optional(string)
  }))
  default = {}
}

variable "nexus_security_content_selector" {
  type = map(object({
    name        = string
    description = optional(string)
    expression  = string
  }))
  default = {}
}

variable "nexus_security_role" {
  type = map(object({
    roleid      = string
    name        = string
    description = optional(string)
    privileges  = optional(set(string))
    roles       = optional(set(string))
  }))
  default = {}
}

variable "nexus_security_saml" {
  type = map(object({
    idp_metadata                 = string
    entity_id                    = optional(string)
    validate_response_signature  = optional(bool)
    validate_assertion_signature = optional(bool)
    username_attribute           = string
    first_name_attribute         = optional(string)
    last_name_attribute          = optional(string)
    email_attribute              = optional(string)
    groups_attribute             = optional(string)
  }))
  default = {}
}

variable "nexus_security_ssl_truststore" {
  type = map(object({
    host = string
    port = number
  }))
  default = {}
}

variable "nexus_security_user" {
  type = map(object({
    userid    = string
    firstname = string
    lastname  = string
    email     = string
    password  = string
    roles     = optional(set(string))
    status    = optional(string)
  }))
  default = {}
}
