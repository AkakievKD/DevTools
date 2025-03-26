resource "vault_policy" "policy" {
  for_each = var.vault_policy

  name      = each.value.name
  namespace = each.value.namespace
  policy    = each.value.policy
}
