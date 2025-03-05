resource "ad_gpo_security" "gpo_security" {
  for_each = var.ad_gpo_security

  gpo_container = each.value.gpo_container

  dynamic "account_lockout" {
    for_each = can(each.value.account_lockout) && each.value.account_lockout != null ? [each.value.account_lockout] : []
    content {
      force_logoff_when_hour_expire = account_lockout.value.force_logoff_when_hour_expire
      lockout_bad_count             = account_lockout.value.lockout_bad_count
      lockout_duration              = account_lockout.value.lockout_duration
      reset_lockout_count           = account_lockout.value.reset_lockout_count
    }
  }

  dynamic "application_log" {
    for_each = can(each.value.application_log) && each.value.application_log != null ? [each.value.application_log] : []
    content {
      audit_log_retention_period = application_log.value.audit_log_retention_period
      maximum_log_size           = application_log.value.maximum_log_size
      restrict_guest_access      = application_log.value.restrict_guest_access
      retention_days             = application_log.value.retention_days
    }
  }

  dynamic "audit_log" {
    for_each = can(each.value.audit_log) && each.value.audit_log != null ? [each.value.audit_log] : []
    content {
      audit_log_retention_period = audit_log.value.audit_log_retention_period
      maximum_log_size           = audit_log.value.maximum_log_size
      restrict_guest_access      = audit_log.value.restrict_guest_access
      retention_days             = audit_log.value.retention_days
    }
  }

  dynamic "event_audit" {
    for_each = can(each.value.event_audit) && each.value.event_audit != null ? [each.value.event_audit] : []
    content {
      audit_account_logon    = event_audit.value.audit_account_logon
      audit_account_manage   = event_audit.value.audit_account_manage
      audit_ds_access        = event_audit.value.audit_ds_access
      audit_logon_events     = event_audit.value.audit_logon_events
      audit_object_access    = event_audit.value.audit_object_access
      audit_policy_change    = event_audit.value.audit_policy_change
      audit_privilege_use    = event_audit.value.audit_privilege_use
      audit_process_tracking = event_audit.value.audit_process_tracking
      audit_system_events    = event_audit.value.audit_system_events
    }
  }

  dynamic "kerberos_policy" {
    for_each = can(each.value.kerberos_policy) && each.value.kerberos_policy != null ? [each.value.kerberos_policy] : []
    content {
      max_clock_skew         = kerberos_policy.value.max_clock_skew
      max_renew_age          = kerberos_policy.value.max_renew_age
      max_service_age        = kerberos_policy.value.max_service_age
      max_ticket_age         = kerberos_policy.value.max_ticket_age
      ticket_validate_client = kerberos_policy.value.ticket_validate_client
    }
  }

  dynamic "password_policies" {
    for_each = can(each.value.password_policies) && each.value.password_policies != null ? [each.value.password_policies] : []
    content {
      clear_text_password     = password_policies.value.clear_text_password
      maximum_password_age    = password_policies.value.maximum_password_age
      minimum_password_age    = password_policies.value.minimum_password_age
      minimum_password_length = password_policies.value.minimum_password_length
      password_complexity     = password_policies.value.password_complexity
      password_history_size   = password_policies.value.password_history_size
    }
  }

  dynamic "system_log" {
    for_each = can(each.value.system_log) && each.value.system_log != null ? [each.value.system_log] : []
    content {
      audit_log_retention_period = system_log.value.audit_log_retention_period
      maximum_log_size           = system_log.value.maximum_log_size
      restrict_guest_access      = system_log.value.restrict_guest_access
      retention_days             = system_log.value.retention_days
    }
  }

  dynamic "filesystem" {
    for_each = each.value.filesystem
    content {
      acl              = filesystem.value.acl
      path             = filesystem.value.path
      propagation_mode = filesystem.value.propagation_mode
    }
  }

  dynamic "registry_keys" {
    for_each = each.value.registry_keys
    content {
      acl              = registry_keys.value.acl
      key_name         = registry_keys.value.key_name
      propagation_mode = registry_keys.value.propagation_mode
    }
  }

  dynamic "registry_values" {
    for_each = each.value.registry_values
    content {
      key_name   = registry_values.value.key_name
      value      = registry_values.value.value
      value_type = registry_values.value.value_type
    }
  }

  dynamic "restricted_groups" {
    for_each = each.value.restricted_groups
    content {
      group_name     = restricted_groups.value.group_name
      group_members  = restricted_groups.value.group_members
      group_memberof = restricted_groups.value.group_memberof
    }
  }

  dynamic "system_services" {
    for_each = each.value.system_services
    content {
      acl          = system_services.value.acl
      service_name = system_services.value.service_name
      startup_mode = system_services.value.startup_mode
    }
  }
}
