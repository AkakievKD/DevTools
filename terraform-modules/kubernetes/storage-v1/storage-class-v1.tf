resource "kubernetes_storage_class_v1" "storage_class_v1" {
  for_each = { for key, value in var.kubernetes_storage_class_v1 : key => value }

  metadata {
    name          = each.key
    labels        = each.value.labels
    annotations   = each.value.annotations
    generate_name = each.value.generate_name
  }

  storage_provisioner    = each.value.storage_provisioner
  allow_volume_expansion = each.value.allow_volume_expansion
  reclaim_policy         = each.value.reclaim_policy
  volume_binding_mode    = each.value.volume_binding_mode
  mount_options          = each.value.mount_options
  parameters             = each.value.parameters

  allowed_topologies {
    dynamic "match_label_expressions" {
      for_each = from.value.match_label_expressions
      content {
        key    = match_label_expressions.value.key
        values = match_label_expressions.value.values
      }
    }
  }
}
