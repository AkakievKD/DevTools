variable "nexus_repository_apt_hosted" {
  type = map(object({
    distribution                           = string
    online                                 = optional(bool)
    signin_gkeypair                        = string
    signing_passphrase                     = optional(string)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    storage_write_policy                   = optional(string)

    cleanup = optional(list(object({
      policy_names = optional(set(string))
    })), [])

    component = optional(object({
      proprietary_components = string
    }), null)
  }))
  default = {}
}

variable "nexus_repository_docker_hosted" {
  type = map(object({
    online                                 = optional(bool)
    docker_force_basic_auth                = bool
    docker_v1_enabled                      = bool
    docker_http_port                       = optional(number)
    docker_https_port                      = optional(number)
    docker_subdomain                       = optional(string)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    storage_write_policy                   = optional(string)
    storage_latest_policy                  = optional(bool)

    cleanup = optional(list(object({
      policy_names = optional(set(string))
    })), [])

    component = optional(object({
      proprietary_components = string
    }), null)
  }))
  default = {}
}

variable "nexus_repository_gitlfs_hosted" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    storage_write_policy                   = optional(string)

    cleanup = optional(list(object({
      policy_names = optional(set(string))
    })), [])

    component = optional(object({
      proprietary_components = string
    }), null)
  }))
  default = {}
}

variable "nexus_repository_helm_hosted" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    storage_write_policy                   = optional(string)

    cleanup = optional(list(object({
      policy_names = optional(set(string))
    })), [])

    component = optional(object({
      proprietary_components = string
    }), null)
  }))
  default = {}
}

variable "nexus_repository_maven_hosted" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    storage_write_policy                   = optional(string)
    maven_layout_policy                    = string
    maven_version_policy                   = string
    maven_content_disposition              = optional(string)

    cleanup = optional(list(object({
      policy_names = optional(set(string))
    })), [])

    component = optional(object({
      proprietary_components = string
    }), null)
  }))
  default = {}
}

variable "nexus_repository_npm_hosted" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    storage_write_policy                   = optional(string)

    cleanup = optional(list(object({
      policy_names = optional(set(string))
    })), [])

    component = optional(object({
      proprietary_components = string
    }), null)
  }))
  default = {}
}

variable "nexus_repository_nuget_hosted" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    storage_write_policy                   = optional(string)

    cleanup = optional(list(object({
      policy_names = optional(set(string))
    })), [])

    component = optional(object({
      proprietary_components = string
    }), null)
  }))
  default = {}
}

variable "nexus_repository_pypi_hosted" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    storage_write_policy                   = optional(string)

    cleanup = optional(list(object({
      policy_names = optional(set(string))
    })), [])

    component = optional(object({
      proprietary_components = string
    }), null)
  }))
  default = {}
}

variable "nexus_repository_r_hosted" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    storage_write_policy                   = optional(string)

    cleanup = optional(list(object({
      policy_names = optional(set(string))
    })), [])

    component = optional(object({
      proprietary_components = string
    }), null)
  }))
  default = {}
}

variable "nexus_repository_raw_hosted" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    storage_write_policy                   = optional(string)

    cleanup = optional(list(object({
      policy_names = optional(set(string))
    })), [])

    component = optional(object({
      proprietary_components = string
    }), null)
  }))
  default = {}
}

variable "nexus_repository_rubygems_hosted" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    storage_write_policy                   = optional(string)

    cleanup = optional(list(object({
      policy_names = optional(set(string))
    })), [])

    component = optional(object({
      proprietary_components = string
    }), null)
  }))
  default = {}
}

variable "nexus_repository_yum_hosted" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    storage_write_policy                   = optional(string)
    deploy_policy                          = optional(string)
    repodata_depth                         = optional(number)

    cleanup = optional(list(object({
      policy_names = optional(set(string))
    })), [])

    component = optional(object({
      proprietary_components = string
    }), null)
  }))
  default = {}
}
