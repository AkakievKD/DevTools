variable "vault_policy" {
  type = map(object({
    name      = string
    policy    = string
    namespace = optional(string)
  }))
  default = {}
}
