variable "vault_identity_group_member_entity_ids" {
  type = map(object({
    group_id          = string
    namespace         = optional(string)
    exclusive         = optional(bool)
    member_entity_ids = optional(set(string))
  }))
  default = {}
}

variable "vault_identity_group_member_group_ids" {
  type = map(object({
    group_id         = string
    namespace        = optional(string)
    exclusive        = optional(bool)
    member_group_ids = optional(set(string))
  }))
  default = {}
}
