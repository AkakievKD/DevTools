variable "kubernetes_pod_disruption_budget_v1" {
  type = map(object({
    generate_name         = optional(string)
    annotations           = optional(map(string))
    labels                = optional(map(string))
    namespace             = optional(string)
    min_available         = optional(string)
    max_unavailable       = optional(string)
    selector_match_labels = optional(map(string))

    selector_match_expressions = optional(list(object({
      key      = optional(string)
      operator = optional(string)
      values   = optional(set(string))
    })), [])
  }))
  default = []
}
