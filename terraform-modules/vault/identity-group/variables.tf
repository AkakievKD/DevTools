variable "vault_identity_group" {
  type = map(object({
    name                       = string
    namespace                  = optional(string)
    type                       = optional(string)
    policies                   = optional(set(string))
    metadata                   = optional(map(string))
    member_group_ids           = optional(set(string))
    member_entity_ids          = optional(set(string))
    external_policies          = optional(bool)
    external_member_entity_ids = optional(bool)
    external_member_group_ids  = optional(bool)
  }))
  default = {}
}