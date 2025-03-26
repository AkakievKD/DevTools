variable "vault_identity_group_alias" {
  type = map(object({
    name           = string
    mount_accessor = string
    canonical_id   = string
    namespace      = optional(string)
  }))
  default = {}
}

variable "vault_identity_group_policies" {
  type = map(object({
    group_id  = string
    policies  = set(string)
    namespace = optional(string)
    exclusive = optional(bool)
  }))
  default = {}
}
