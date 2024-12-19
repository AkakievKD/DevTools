locals {
  secrets_envs = merge(
    flatten([
      for module in var.vault_secrets : [
        module.secret_envs
      ]
    ])...
  )

  secrets_file = flatten([
    for module in var.vault_secrets : [
      for template in module.secret_file_template : merge(template, {
        secrets_envs = local.secrets_envs
      })
    ]
  ])
}

resource "local_file" "secrets" {
  for_each = { for idx, file in local.secrets_file : idx => file }
  filename = each.value.filename
  content  = templatefile(each.value.content, merge(each.value.secrets_envs, {}))
}
