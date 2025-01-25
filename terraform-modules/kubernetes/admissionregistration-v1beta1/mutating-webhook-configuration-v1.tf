resource "kubernetes_mutating_webhook_configuration" "mutating_webhook_configuration" {
  for_each = { for key, value in var.kubernetes_mutating_webhook_configuration_v1 : key => value }

  metadata {
    name          = each.key
    generate_name = each.value.generate_name
    annotations   = each.value.annotations
    labels        = each.value.labels
  }

  dynamic "webhook" {
    for_each = each.value.webhook
    content {
      name                      = webhook.value.name
      admission_review_versions = webhook.value.admission_review_versions
      failure_policy            = webhook.value.failure_policy
      match_policy              = webhook.value.match_policy
      reinvocation_policy       = webhook.value.reinvocation_policy
      side_effects              = webhook.value.side_effects
      timeout_seconds           = webhook.value.timeout_seconds

      dynamic "client_config" {
        for_each = can(webhook.value.client_config) && webhook.value.client_config != null ? [webhook.value.client_config] : []
        content {
          ca_bundle = client_config.value.ca_bundle
          url       = client_config.value.url

          dynamic "service" {
            for_each = can(client_config.value.service) && client_config.value.service != null ? [client_config.value.service] : []
            content {
              name      = service.value.name
              namespace = service.value.namespace
              path      = service.value.path
              port      = service.value.port
            }
          }
        }
      }

      dynamic "namespace_selector" {
        for_each = can(webhook.value.namespace_selector) && webhook.value.namespace_selector != null ? [webhook.value.namespace_selector] : []
        content {
          match_labels = namespace_selector.value.match_labels

          dynamic "match_expressions" {
            for_each = namespace_selector.value.match_expressions
            content {
              key      = match_expressions.value.key
              operator = match_expressions.value.operator
              values   = match_expressions.value.values
            }
          }
        }
      }

      dynamic "object_selector" {
        for_each = can(webhook.value.object_selector) && webhook.value.object_selector != null ? [webhook.value.object_selector] : []
        content {
          match_labels = object_selector.value.match_labels

          dynamic "match_expressions" {
            for_each = object_selector.value.match_expressions
            content {
              key      = match_expressions.value.key
              operator = match_expressions.value.operator
              values   = match_expressions.value.values
            }
          }
        }
      }

      dynamic "rule" {
        for_each = webhook.value.rule
        content {
          api_groups   = rule.value.api_groups
          api_versions = rule.value.api_versions
          operations   = rule.value.operations
          resources    = rule.value.resources
          scope        = rule.value.scope
        }
      }
    }
  }
}
