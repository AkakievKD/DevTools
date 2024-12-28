variable "harbor_project" {
  type = map(object({
    public                      = optional(bool)
    vulnerability_scanning      = optional(bool)
    enable_content_trust        = optional(bool)
    enable_content_trust_cosign = optional(bool)
    registry_id                 = optional(number)
    cve_allowlist               = optional(list(string))
    deployment_security         = optional(string)
    force_destroy               = optional(bool)
    storage_quota               = optional(number)
    auto_sbom_generation        = optional(bool)
  }))
  default = {}
}

variable "harbor_tasks" {
  type = list(object({
    vulnerability_scan_policy = string
  }))
  default = []
}

variable "harbor_retention_policy" {
  type = list(object({
    scope    = string
    schedule = optional(string)

    rule = list(object({
      always_retain          = optional(bool)
      disabled               = optional(bool)
      most_recently_pulled   = optional(number)
      most_recently_pushed   = optional(number)
      n_days_since_last_pull = optional(number)
      n_days_since_last_push = optional(number)
      repo_excluding         = optional(string)
      repo_matching          = optional(string)
      tag_excluding          = optional(string)
      tag_matching           = optional(string)
      untagged_artifacts     = optional(bool)
    }))
  }))
  default = []
}

variable "harbor_project_webhook" {
  type = map(object({
    name             = string
    address          = string
    project_id       = string
    notify_type      = string
    events_types     = list(string)
    auth_header      = optional(string)
    description      = optional(string)
    enabled          = optional(bool)
    skip_cert_verify = optional(bool)
  }))
  default = {}
}

variable "harbor_replication" {
  type = map(object({
    name                   = string
    action                 = string
    registry_id            = number
    schedule               = optional(string)
    deletion               = optional(bool)
    description            = optional(string)
    dest_namespace         = optional(string)
    dest_namespace_replace = optional(number)
    copy_by_chunk          = optional(bool)
    enabled                = optional(bool)
    execute_on_changed     = optional(bool)
    override               = optional(bool)
    speed                  = optional(number)

    filters = optional(list(object({
      name       = optional(string)
      decoration = optional(string)
      labels     = optional(list(string))
      resource   = optional(string)
      tag        = optional(string)
    })), [])
  }))
  default = {}
}

variable "harbor_preheat_instance" {
  type = map(object({
    name        = string
    vendor      = string
    description = optional(string)
    endpoint    = string
    auth_mode   = optional(string)
    username    = optional(string)
    password    = optional(string)
    token       = optional(string)
    default     = optional(bool)
    enabled     = optional(bool)
    insecure    = optional(bool)
  }))
  default = {}
}

variable "harbor_label" {
  type = list(object({
    name        = string
    color       = optional(string)
    description = optional(string)
    project_id  = optional(string)
  }))
  default = []
}

variable "harbor_immutable_tag_rule" {
  type = list(object({
    disabled       = optional(bool)
    project_id     = string
    repo_matching  = optional(string)
    repo_excluding = optional(string)
    tag_matching   = optional(string)
    tag_excluding  = optional(string)
  }))
  default = []
}

variable "harbor_config_auth" {
  type = map(object({
    primary_auth_mode     = optional(bool)
    oidc_name             = optional(string) #Required for oidc auth mode
    oidc_endpoint         = optional(string) #Required for oidc auth mode
    oidc_client_id        = optional(string) #Required for oidc auth mode
    oidc_client_secret    = optional(string) #Required for oidc auth mode
    oidc_scope            = optional(string) #Required for oidc auth mode
    oidc_verify_cert      = optional(bool)   #Required for oidc auth mode
    oidc_auto_onboard     = optional(bool)
    oidc_admin_group      = optional(string)
    oidc_group_filter     = optional(string)
    oidc_groups_claim     = optional(string)
    oidc_user_claim       = optional(string)
    ldap_url              = optional(string) #Required for ldap auth mode
    ldap_search_dn        = optional(string)
    ldap_search_password  = optional(string)
    ldap_base_dn          = optional(string) #Required for ldap auth mode
    ldap_uid              = optional(string) #Required for ldap auth mode
    ldap_verify_cert      = optional(bool)   #Required for ldap auth mode
    ldap_filter           = optional(string)
    ldap_group_admin_dn   = optional(string)
    ldap_group_base_dn    = optional(string)
    ldap_group_gid        = optional(string)
    ldap_group_membership = optional(string)
    ldap_group_scope      = optional(string)
    ldap_group_filter     = optional(string)
    ldap_group_uid        = optional(string)
  }))
  default = {}
}

variable "harbor_registry" {
  type = map(object({
    provider_name = string
    name          = string
    endpoint_url  = string
    access_id     = optional(string)
    access_secret = optional(string)
    description   = optional(string)
    insecure      = optional(bool)
  }))
  default = {}
}

variable "harbor_user" {
  type = map(object({
    password  = string
    full_name = string
    email     = string
    admin     = optional(bool)
    comment   = optional(string)
  }))
  default = {}
}

variable "harbor_interrogation_services" {
  type = list(object({
    default_scanner           = optional(string)
    vulnerability_scan_policy = string
  }))
  default = []
}

variable "harbor_robot_account" {
  type = map(object({
    description = optional(string)
    secret      = optional(string)
    level       = string
    disable     = optional(bool)
    duration    = optional(number)

    permissions = list(object({
      kind      = string
      namespace = string

      access = list(object({
        action   = string
        resource = string
        effect   = optional(string)
      }))
    }))
  }))
  default = {}
}

variable "harbor_purge_audit_log" {
  type = list(object({
    schedule             = string
    audit_retention_hour = number
    include_operations   = string
  }))
  default = []
}

variable "harbor_project_member_user" {
  type = list(object({
    project_id = string
    user_name  = string
    role       = string
  }))
  default = []
}

variable "harbor_project_member_group" {
  type = list(object({
    project_id    = string
    group_name    = optional(string)
    role          = string
    type          = string
    group_id      = optional(string)
    ldap_group_dn = optional(string)
  }))
  default = []
}

variable "harbor_group" {
  type = list(object({
    group_name    = string
    group_type    = number
    ldap_group_dn = optional(string)
  }))
  default = []
}

variable "harbor_garbage_collection" {
  type = list(object({
    schedule        = string
    delete_untagged = optional(bool)
    workers         = optional(number)
  }))
  default = []
}

variable "harbor_config_system" {
  type = list(object({
    project_creation_restriction = optional(string)
    robot_token_expiration       = optional(number)
    robot_name_prefix            = optional(string)
    storage_per_project          = optional(number)
    scanner_skip_update_pulltime = optional(bool)
    read_only                    = optional(bool)
    audit_log_forward_endpoint   = optional(string)
    skip_audit_log_database      = optional(bool)

    banner_message = optional(object({
      message   = string
      closable  = optional(bool)
      type      = optional(string)
      from_date = optional(string)
      to_date   = optional(string)
    }), null)
  }))
  default = []
}

variable "harbor_config_security" {
  type = list(object({
    cve_allowlist = list(string)
    expires_at    = optional(string)
  }))
  default = []
}
