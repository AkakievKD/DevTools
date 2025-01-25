variable "kubernetes_runtime_class_v1" {
  type = list(object({
    generate_name = optional(string)
    annotations   = optional(map(string))
    labels        = optional(map(string))
    handler       = string
  }))
  default = {}
}
