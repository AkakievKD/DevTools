variable "vault_path" {
  type = string
}

variable "vault_secrets" {
  description = "List of vault modules"
  type = list(object({
    secret_envs = map(string)
    secret_file_template = list(object({
      filename = string
      content  = string
    }))
  }))
  default = []
}
