resource "argocd_project_token" "project_token" {
  for_each     = { for key, value in var.argocd_project_token : key => value }
  project      = each.value.project
  role         = each.value.role
  description  = each.value.description
  expires_in   = each.value.expires_in
  renew_after  = each.value.renew_after
  renew_before = each.value.renew_before
}
