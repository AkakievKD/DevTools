variable "nexus_routing_rule" {
  type = map(object({
    description = optional(string)
    mode        = optional(string)
    matchers    = set(string)
  }))
  default = {}
}
