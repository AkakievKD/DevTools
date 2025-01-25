resource "kubernetes_network_policy_v1" "network_policy_v1" {
  for_each = { for key in var.kubernetes_network_policy_v1 : key.name => key }

  metadata {
    name          = each.value.name
    labels        = each.value.labels
    annotations   = each.value.annotations
    namespace     = each.value.namespace
    generate_name = each.value.generate_name
  }

  spec {
    pod_selector {
      dynamic "match_expressions" {
        for_each = each.value.spec_pod_selector_match_expressions
        content {
          key      = match_expressions.value.key
          operator = match_expressions.value.operator
          values   = match_expressions.value.values
        }
      }
      match_labels = each.value.spec_pod_selector_match_labels
    }

    policy_types = each.value.spec_policy_types

    dynamic "ingress" {
      for_each = each.value.ingress
      content {
        dynamic "from" {
          for_each = ingress.value.from
          content {
            ip_block {
              cidr   = from.value.ip_block_cidr
              except = from.value.ip_block_except
            }

            pod_selector {
              dynamic "match_expressions" {
                for_each = from.value.pod_selector_match_expressions
                content {
                  key      = match_expressions.value.key
                  operator = match_expressions.value.operator
                  values   = match_expressions.value.values
                }
              }

              match_labels = from.value.pod_selector_match_labels
            }

            namespace_selector {
              dynamic "match_expressions" {
                for_each = from.value.namespace_selector_match_expressions
                content {
                  key      = match_expressions.value.key
                  operator = match_expressions.value.operator
                  values   = match_expressions.value.values
                }
              }

              match_labels = from.value.namespace_selector_match_labels
            }
          }
        }

        dynamic "ports" {
          for_each = ingress.value.ports
          content {
            port     = ports.value.port
            protocol = ports.value.protocol
            end_port = ports.value.end_port
          }
        }
      }
    }

    dynamic "egress" {
      for_each = each.value.egress
      content {
        dynamic "to" {
          for_each = egress.value.to
          content {
            ip_block {
              cidr   = to.value.ip_block_cidr
              except = to.value.ip_block_except
            }

            pod_selector {
              dynamic "match_expressions" {
                for_each = to.value.pod_selector_match_expressions
                content {
                  key      = match_expressions.value.key
                  operator = match_expressions.value.operator
                  values   = match_expressions.value.values
                }
              }

              match_labels = to.value.pod_selector_match_labels
            }

            namespace_selector {
              dynamic "match_expressions" {
                for_each = to.value.namespace_selector_match_expressions
                content {
                  key      = match_expressions.value.key
                  operator = match_expressions.value.operator
                  values   = match_expressions.value.values
                }
              }

              match_labels = to.value.namespace_selector_match_labels
            }
          }
        }

        dynamic "ports" {
          for_each = egress.value.ports
          content {
            port     = ports.value.port
            protocol = ports.value.protocol
            end_port = ports.value.end_port
          }
        }
      }
    }
  }
}
