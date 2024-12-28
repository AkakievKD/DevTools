resource "argocd_repository_credentials" "repository_credentials" {
  for_each                      = { for key in var.argocd_repository_credentials : key.url => key }
  url                           = each.value.url
  enable_oci                    = each.value.enable_oci
  githubapp_enterprise_base_url = each.value.githubapp_enterprise_base_url
  githubapp_id                  = each.value.githubapp_id
  githubapp_installation_id     = each.value.githubapp_installation_id
  githubapp_private_key         = each.value.githubapp_private_key
  password                      = each.value.password
  ssh_private_key               = each.value.ssh_private_key
  tls_client_cert_data          = each.value.tls_client_cert_data
  tls_client_cert_key           = each.value.tls_client_cert_key
  username                      = each.value.username
}
