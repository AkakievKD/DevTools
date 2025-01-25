resource "kubernetes_pod_disruption_budget_v1" "pod_disruption_budget" {
  for_each = { for key, value in var.kubernetes_pod_disruption_budget_v1 : key => value }

  metadata {
    name          = each.key
    labels        = each.value.labels
    annotations   = each.value.annotations
    generate_name = each.value.generate_name
    namespace     = each.value.namespace
  }

  spec {
    min_available   = each.value.min_available
    max_unavailable = each.value.max_unavailable

    selector {
      dynamic "match_expressions" {
        for_each = each.value.selector_match_expressions
        content {
          key      = match_expressions.value.key
          operator = match_expressions.value.operator
          values   = match_expressions.value.values
        }
      }
      match_labels = each.value.selector_match_labels
    }
  }
}
