variable "nexus_repository_docker_group" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    docker_force_basic_auth                = bool
    docker_v1_enabled                      = bool
    docker_http_port                       = optional(number)
    docker_https_port                      = optional(number)
    docker_subdomain                       = optional(string)
    group_member_names                     = list(string)
    group_writable_member                  = optional(string)
  }))
  default = {}
}

variable "nexus_repository_go_group" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    group_member_names                     = list(string)
  }))
  default = {}
}

variable "nexus_repository_maven_group" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    group_member_names                     = list(string)
  }))
  default = {}
}

variable "nexus_repository_npm_group" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    group_member_names                     = list(string)
    group_writable_member                  = optional(string)
  }))
  default = {}
}

variable "nexus_repository_nuget_group" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    group_member_names                     = list(string)
  }))
  default = {}
}

variable "nexus_repository_pypi_group" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    group_member_names                     = list(string)
  }))
  default = {}
}

variable "nexus_repository_r_group" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    group_member_names                     = list(string)
  }))
  default = {}
}

variable "nexus_repository_raw_group" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    group_member_names                     = list(string)
  }))
  default = {}
}

variable "nexus_repository_rubygems_group" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    group_member_names                     = list(string)
  }))
  default = {}
}

variable "nexus_repository_yum_group" {
  type = map(object({
    online                                 = optional(bool)
    storage_blob_store_name                = string
    storage_strict_content_type_validation = bool
    group_member_names                     = list(string)
    yum_signing_keypair                    = string
    yum_signing_passphrase                 = optional(string)
  }))
  default = {}
}
