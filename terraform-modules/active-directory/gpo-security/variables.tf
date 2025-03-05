variable "ad_gpo_security" {
  type = map(object({
    gpo_container = string

    account_lockout = optional(object({
      force_logoff_when_hour_expire = optional(string)
      lockout_bad_count             = optional(string)
      lockout_duration              = optional(string)
      reset_lockout_count           = optional(string)
    }), null)

    application_log = optional(object({
      audit_log_retention_period = optional(string)
      maximum_log_size           = optional(string)
      restrict_guest_access      = optional(string)
      retention_days             = optional(string)
    }), null)

    audit_log = optional(object({
      audit_log_retention_period = optional(string)
      maximum_log_size           = optional(string)
      restrict_guest_access      = optional(string)
      retention_days             = optional(string)
    }), null)

    event_audit = optional(object({
      audit_account_logon    = optional(string)
      audit_account_manage   = optional(string)
      audit_ds_access        = optional(string)
      audit_logon_events     = optional(string)
      audit_object_access    = optional(string)
      audit_policy_change    = optional(string)
      audit_privilege_use    = optional(string)
      audit_process_tracking = optional(string)
      audit_system_events    = optional(string)
    }), null)

    kerberos_policy = optional(object({
      max_clock_skew         = optional(string)
      max_renew_age          = optional(string)
      max_service_age        = optional(string)
      max_ticket_age         = optional(string)
      ticket_validate_client = optional(string)
    }), null)

    password_policies = optional(object({
      clear_text_password     = optional(string)
      maximum_password_age    = optional(string)
      minimum_password_age    = optional(string)
      minimum_password_length = optional(string)
      password_complexity     = optional(string)
      password_history_size   = optional(string)
    }), null)

    system_log = optional(object({
      audit_log_retention_period = optional(string)
      maximum_log_size           = optional(string)
      restrict_guest_access      = optional(string)
      retention_days             = optional(string)
    }), null)

    filesystem = optional(list(object({
      acl              = string
      path             = string
      propagation_mode = string
    })), [])

    registry_keys = optional(list(object({
      acl              = string
      key_name         = string
      propagation_mode = string
    })), [])

    registry_values = optional(list(object({
      key_name   = string
      value      = string
      value_type = string
    })), [])

    restricted_groups = optional(list(object({
      group_name     = string
      group_members  = string
      group_memberof = string
    })), [])

    system_services = optional(list(object({
      acl          = string
      service_name = string
      startup_mode = string
    })), [])
  }))
  default = {}
}
