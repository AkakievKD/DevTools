resource "kubernetes_cluster_role_v1" "cluster_role_v1" {
  for_each = { for key, value in var.kubernetes_cluster_role_v1 : key => value }

  metadata {
    name          = each.key
    labels        = each.value.labels
    annotations   = each.value.annotations
    generate_name = each.value.generate_name
  }

  aggregation_rule {
    cluster_role_selectors {
      match_labels = each.value.cluster_role_selectors_match_labels

      dynamic "match_expressions" {
        for_each = each.value.cluster_role_selectors_match_expressions
        content {
          key      = match_expressions.value.key
          operator = match_expressions.value.operator
          values   = match_expressions.value.values
        }
      }
    }
  }

  dynamic "rule" {
    for_each = each.value.rule
    content {
      api_groups        = rule.value.api_groups
      resources         = rule.value.resource
      verbs             = rule.value.verbs
      resource_names    = rule.value.resource_names
      non_resource_urls = rule.value.non_resource_urls
    }
  }
}
