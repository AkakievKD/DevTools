variable "nexus_blobstore_azure" {
  type = map(object({
    bucket_configuration_account_name   = string
    bucket_configuration_container_name = string
    authentication_method               = string
    authentication_account_key          = optional(string)

    soft_quota = optional(object({
      limit = number
      type  = string
    }), null)
  }))
  default = {}
}

variable "nexus_blobstore_file" {
  type = map(object({
    name = string
    path = optional(string)

    soft_quota = optional(object({
      limit = number
      type  = string
    }), null)
  }))
  default = {}
}

variable "nexus_blobstore_group" {
  type = map(object({
    fill_policy = string
    members     = set(string)

    soft_quota = optional(object({
      limit = number
      type  = string
    }), null)
  }))
  default = {}
}

variable "nexus_blobstore_s3" {
  type = map(object({
    bucket_configuration_bucket_expiration = number
    bucket_configuration_bucket_name       = string
    bucket_configuration_bucket_region     = string
    bucket_configuration_bucket_prefix     = optional(string)

    advanced_bucket_connection = optional(object({
      endpoint                 = optional(string)
      force_path_style         = optional(bool)
      max_connection_pool_size = optional(number)
      signer_type              = optional(string)
    }), null)

    bucket_security = optional(object({
      access_key_id     = optional(string)
      secret_access_key = optional(string)
      role              = optional(string)
      session_token     = optional(string)
    }), null)

    encryption = optional(object({
      encryption_key  = optional(string)
      encryption_type = optional(string)
    }), null)

    soft_quota = optional(object({
      limit = number
      type  = string
    }), null)
  }))
  default = {}
}
