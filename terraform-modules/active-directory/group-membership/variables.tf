variable "ad_group_membership" {
  type = map(object({
    group_id      = string
    group_members = set(string)
  }))
  default = {}
}