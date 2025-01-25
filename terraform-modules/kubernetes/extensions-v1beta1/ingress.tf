resource "kubernetes_ingress" "ingress" {
  for_each = { for key, value in var.kubernetes_ingress : key => value }

  metadata {
    name          = each.key
    labels        = each.value.labels
    annotations   = each.value.annotations
    namespace     = each.value.namespace
    generate_name = each.value.generate_name
  }

  wait_for_load_balancer = each.value.wait_for_load_balancer

  spec {
    ingress_class_name = each.value.ingress_class_name

    backend {
      service_name = each.value.backend_service_name
      service_port = each.value.backend_service_port
    }

    dynamic "rule" {
      for_each = each.value.rule
      content {
        host = rule.value.rule_host

        http {
          dynamic "path" {
            for_each = rule.value.path
            content {
              path = path.value.path

              backend {
                service_name = path.value.backend_service_name
                service_port = path.value.backend_service_port
              }
            }
          }
        }
      }
    }

    dynamic "tls" {
      for_each = each.value.tls
      content {
        hosts       = tls.value.hosts
        secret_name = tls.value.secret_name
      }
    }
  }
}
