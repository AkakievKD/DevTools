resource "kubernetes_priority_class_v1" "priority_class_v1" {
  for_each = { for key, value in var.kubernetes_priority_class_v1 : key => value }

  metadata {
    name          = each.key
    labels        = each.value.labels
    annotations   = each.value.annotations
    generate_name = each.value.generate_name
  }

  value             = each.value.value
  description       = each.value.description
  global_default    = each.value.global_default
  preemption_policy = each.value.preemption_policy
}
