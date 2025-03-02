variable "nexus_privilege_application" {
  type = map(object({
    description = optional(string)
    actions     = list(string)
    domain      = string
  }))
  default = {}
}

variable "nexus_privilege_repository_admin" {
  type = map(object({
    description = optional(string)
    actions     = list(string)
    repository  = string
    format      = string
  }))
  default = {}
}

variable "nexus_privilege_repository_content_selector" {
  type = map(object({
    description      = optional(string)
    actions          = list(string)
    repository       = string
    format           = string
    content_selector = string
  }))
  default = {}
}

variable "nexus_privilege_repository_view" {
  type = map(object({
    description = optional(string)
    actions     = list(string)
    repository  = string
    format      = string
  }))
  default = {}
}

variable "nexus_privilege_script" {
  type = map(object({
    description = optional(string)
    actions     = list(string)
    script_name = string
  }))
  default = {}
}

variable "nexus_privilege_wildcard" {
  type = map(object({
    name        = string
    description = optional(string)
    pattern     = string
  }))
  default = {}
}
