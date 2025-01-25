resource "kubernetes_manifest" "manifest" {
  for_each = { for key, value in var.kubernetes_manifest : key => value }

  manifest        = each.value.manifest
  computed_fields = each.value.computed_fields
  object          = each.value.object

  field_manager {
    name            = each.key
    force_conflicts = each.value.field_manager_force_conflicts
  }

  timeouts {
    create = each.value.timeouts_create
    delete = each.value.timeouts_delete
    update = each.value.timeouts_update
  }

  wait {
    rollout = each.value.wait_rollout
    fields  = each.value.wait_fields
    dynamic "condition" {
      for_each = each.value.wait_condition
      content {
        status = condition.value.wait_condition_status
        type   = condition.value.wait_condition_type
      }
    }
  }
}
