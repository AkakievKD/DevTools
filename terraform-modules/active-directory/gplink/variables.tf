variable "ad_gplink" {
  type = map(object({
    gpo_guid  = string
    target_dn = string
    enforced  = optional(bool)
    enabled   = optional(bool)
    id        = optional(string)
    order     = optional(number)
  }))
  default = {}
}