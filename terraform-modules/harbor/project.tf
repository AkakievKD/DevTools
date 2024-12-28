resource "harbor_project" "project" {
  for_each                    = { for key, value in var.harbor_project : key => value }
  name                        = each.key
  public                      = each.value.public
  vulnerability_scanning      = each.value.vulnerability_scanning
  enable_content_trust        = each.value.enable_content_trust
  enable_content_trust_cosign = each.value.enable_content_trust_cosign
  registry_id                 = each.value.registry_id
  cve_allowlist               = each.value.cve_allowlist
  deployment_security         = each.value.deployment_security
  force_destroy               = each.value.force_destroy
  storage_quota               = each.value.storage_quota
  auto_sbom_generation        = each.value.auto_sbom_generation
}
