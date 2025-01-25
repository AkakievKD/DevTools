variable "kubernetes_priority_class_v1" {
  type = map(object({
    generate_name     = optional(string)
    annotations       = optional(map(string))
    labels            = optional(map(string))
    value             = number
    description       = optional(string)
    global_default    = optional(bool)
    preemption_policy = optional(string)
  }))
  default = []
}

variable "kubernetes_priority_class" {
  type = map(object({
    generate_name     = optional(string)
    annotations       = optional(map(string))
    labels            = optional(map(string))
    value             = number
    description       = optional(string)
    global_default    = optional(bool)
    preemption_policy = optional(string)
  }))
  default = []
}
