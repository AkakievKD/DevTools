resource "argocd_repository" "repository" {
  for_each                      = { for key in var.argocd_repository : key.repo => key }
  repo                          = each.value.repo
  type                          = each.value.type
  name                          = each.value.name
  password                      = each.value.password
  project                       = each.value.project
  username                      = each.value.username
  insecure                      = each.value.insecure
  ssh_private_key               = each.value.ssh_private_key
  enable_lfs                    = each.value.enable_lfs
  enable_oci                    = each.value.enable_oci
  githubapp_enterprise_base_url = each.value.githubapp_enterprise_base_url
  githubapp_id                  = each.value.githubapp_id
  githubapp_installation_id     = each.value.githubapp_installation_id
  githubapp_private_key         = each.value.githubapp_private_key
  tls_client_cert_data          = each.value.tls_client_cert_data
  tls_client_cert_key           = each.value.tls_client_cert_key
}
