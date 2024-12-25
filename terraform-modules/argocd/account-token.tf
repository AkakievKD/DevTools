resource "argocd_account_token" "token" {
  for_each     = { for key, value in var.argocd_account_token : key => value }
  account      = each.value.account
  expires_in   = each.value.expires_in
  renew_after  = each.value.renew_after
  renew_before = each.value.renew_before
}
