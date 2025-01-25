resource "kubernetes_ingress_v1" "ingress_v1" {
  for_each = { for key, value in var.kubernetes_ingress_v1 : key => value }

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

    default_backend {
      resource {
        api_group = each.value.default_backend_resource_api_group
        kind      = each.value.default_backend_resource_kind
        name      = each.value.default_backend_resource_name
      }
      service {
        name = each.value.default_backend_service_name
        port {
          number = each.value.default_backend_service_port_number
        }
      }
    }

    dynamic "rule" {
      for_each = each.value.rule
      content {
        host = rule.value.rule_host

        http {
          dynamic "path" {
            for_each = rule.value.path
            content {
              path      = path.value.path
              path_type = path.value.path_type

              backend {
                resource {
                  api_group = path.value.backend_resource_api_group
                  kind      = path.value.backend_resource_kind
                  name      = path.value.backend_resource_name
                }

                service {
                  name = path.value.backend_service_name
                  port {
                    number = path.value.backend_service_port_number
                  }
                }
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

  timeouts {
    create = each.value.timeouts_create
    delete = each.value.timeouts_delete
  }
}
