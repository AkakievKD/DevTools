variable "kubernetes_ingress" {
  type = map(object({
    labels                 = optional(map(string))
    annotations            = optional(map(string))
    generate_name          = optional(string)
    namespace              = optional(string)
    ingress_class_name     = optional(string)
    wait_for_load_balancer = optional(bool)
    backend_service_name   = optional(string)
    backend_service_port   = optional(string)

    rule = optional(list(object({
      rule_host = optional(string)

      path = list(object({
        path                 = optional(string)
        backend_service_name = optional(string)
        backend_service_port = optional(string)
      }))
    })), [])

    tls = optional(list(object({
      hosts       = optional(list(string))
      secret_name = optional(string)
    })), [])
  }))
  default = {}
}
