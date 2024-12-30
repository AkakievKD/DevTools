variable "minio_s3_bucket" {
  type = map(object({
    acl            = optional(string) #private, public-write, public-read, public-read-write, public
    bucket_name    = optional(string)
    bucket_prefix  = optional(string)
    force_destroy  = optional(bool)
    object_locking = optional(bool)
    quota          = optional(number)
  }))
  default = {}
}

variable "minio_iam_user" {
  type = map(object({
    force_destroy = optional(bool)
    disable_user  = optional(bool)
    secret        = optional(string)
    update_secret = optional(bool)
    tags          = optional(map(string))
  }))
  default = {}
}

variable "minio_iam_group" {
  type = list(object({
    name          = string
    disable_group = optional(bool)
    force_destroy = optional(bool)
  }))
  default = []
}

variable "minio_iam_group_membership" {
  type = map(object({
    group = string
    users = list(string)
  }))
  default = {}
}

variable "minio_iam_group_policy" {
  type = list(object({
    name        = optional(string)
    group       = string
    policy      = string
    name_prefix = optional(string)
  }))
  default = []
}

variable "minio_iam_policy" {
  type = list(object({
    name        = optional(string)
    policy      = string
    name_prefix = optional(string)
  }))
  default = []
}

variable "minio_iam_user_policy_attachment" {
  type = list(object({
    user_name   = string
    policy_name = string
  }))
  default = []
}

variable "minio_iam_group_policy_attachment" {
  type = list(object({
    group_name  = string
    policy_name = string
  }))
  default = []
}

variable "minio_ilm_policy" {
  type = list(object({
    bucket = string

    rule = list(object({
      id         = string
      expiration = optional(string)
      filter     = optional(string)
      tags       = optional(map(string))

      transition = optional(object({
        storage_class = string
        days          = optional(string)
        date          = optional(string)
      }), null)

      noncurrent_transition = optional(object({
        storage_class  = string
        days           = string
        newer_versions = optional(number)
      }), null)

      noncurrent_expiration = optional(object({
        days           = string
        newer_versions = optional(number)
      }), null)
    }))
  }))
  default = []
}

variable "minio_s3_bucket_policy" {
  type = list(object({
    bucket = string
    policy = string
  }))
  default = []
}

variable "minio_iam_group_user_attachment" {
  type = list(object({
    group_name = string
    user_name  = string
  }))
  default = []
}

variable "minio_iam_ldap_group_policy_attachment" {
  type = list(object({
    group_dn    = string
    policy_name = string
  }))
  default = []
}

variable "minio_iam_ldap_user_policy_attachment" {
  type = list(object({
    user_dn     = string
    policy_name = string
  }))
  default = []
}

variable "minio_iam_service_account" {
  type = list(object({
    target_user   = string
    description   = optional(string)
    disable_user  = optional(bool)
    expiration    = optional(string)
    name          = optional(string)
    policy        = optional(string)
    update_secret = optional(bool)
  }))
  default = []
}

variable "minio_ilm_tier" {
  type = map(object({
    bucket                = string
    type                  = string
    endpoint              = optional(string)
    force_new_credentials = optional(bool)
    prefix                = optional(string)
    region                = optional(string)

    s3_config = optional(object({
      access_key    = optional(string)
      secret_key    = optional(string)
      storage_class = optional(string)
    }), null)

    azure_config = optional(object({
      account_name  = optional(string)
      account_key   = optional(string)
      storage_class = optional(string)
    }), null)

    gcs_config = optional(object({
      credentials   = optional(string)
      storage_class = optional(string)
    }), null)

    minio_config = optional(object({
      access_key = optional(string)
      secret_key = optional(string)
    }), null)
  }))
  default = {}
}

variable "minio_kms_key" {
  type = list(object({
    key_id = string
  }))
  default = []
}

variable "minio_s3_bucket_notification" {
  type = list(object({
    bucket = string

    queue = optional(list(object({
      events        = set(string)
      queue_arn     = string
      filter_prefix = optional(string)
      filter_suffix = optional(string)
      id            = optional(string)
    })), [])
  }))
  default = []
}

variable "minio_s3_bucket_replication" {
  type = list(object({
    bucket = string

    rule = optional(list(object({
      delete_marker_replication   = optional(bool)
      delete_replication          = optional(bool)
      enabled                     = optional(bool)
      existing_object_replication = optional(bool)
      metadata_sync               = optional(bool)
      prefix                      = optional(string)
      priority                    = optional(number)
      tags                        = optional(map(string))

      target = object({
        access_key          = string
        bucket              = string
        host                = string
        bandwidth_limit     = optional(string)
        disable_proxy       = optional(bool)
        health_check_period = optional(string)
        path                = optional(string)
        path_style          = optional(string)
        region              = optional(string)
        secret_key          = optional(string)
        secure              = optional(bool)
        storage_class       = optional(string)
        synchronous         = optional(bool)
      })
    })), [])
  }))
  default = []
}

variable "minio_s3_bucket_retention" {
  type = list(object({
    bucket          = optional(string)
    mode            = optional(string)
    unit            = optional(string)
    validity_period = optional(number)
  }))
  default = []
}

variable "minio_s3_bucket_server_side_encryption" {
  type = list(object({
    bucket          = string
    encryption_type = string
    kms_key_id      = string
  }))
  default = []
}

variable "minio_s3_bucket_versioning" {
  type = list(object({
    bucket = string

    versioning_configuration = list(object({
      status            = string
      exclude_folders   = optional(bool)
      excluded_prefixes = optional(list(string))
    }))
  }))
  default = []
}

variable "minio_s3_object" {
  type = list(object({
    bucket_name    = string
    object_name    = string
    content        = optional(string)
    content_base64 = optional(string)
    content_type   = optional(string)
    etag           = optional(string)
    source         = optional(string)
    version_id     = optional(string)
  }))
  default = []
}
