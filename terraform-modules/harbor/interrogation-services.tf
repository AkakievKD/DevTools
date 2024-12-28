resource "harbor_interrogation_services" "interrogation_services" {
  for_each                  = { for key, value in var.harbor_interrogation_services : key => value }
  default_scanner           = each.value.default_scanner
  vulnerability_scan_policy = each.value.vulnerability_scan_policy
}
