resource "argocd_gpg_key" "gpg_key" {
  for_each   = { for key, value in var.argocd_gpg_key : key => value }
  public_key = each.value.public_key
}
