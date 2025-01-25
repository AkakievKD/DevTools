variable "ephemeral_kubernetes_token_request_v1" {
  type = list(object({
    name                         = string
    namespace                    = optional(string)
    audiences                    = optional(list(string))
    expiration_seconds           = optional(number)
    bound_object_ref_api_version = optional(string)
    bound_object_ref_kind        = optional(string)
    bound_object_ref_name        = optional(string)
    bound_object_ref_uid         = optional(string)
  }))
  default = {}
}

variable "kubernetes_token_request_v1" {
  type = list(object({
    name                         = string
    generate_name                = optional(string)
    annotations                  = optional(map(string))
    labels                       = optional(map(string))
    namespace                    = optional(string)
    audiences                    = optional(list(string))
    expiration_seconds           = optional(number)
    bound_object_ref_api_version = optional(string)
    bound_object_ref_kind        = optional(string)
    bound_object_ref_name        = optional(string)
    bound_object_ref_uid         = optional(string)
  }))
  default = {}
}
