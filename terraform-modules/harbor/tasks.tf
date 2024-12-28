resource "harbor_tasks" "tasks" {
  for_each                  = { for key in var.harbor_tasks : key.vulnerability_scan_policy => key }
  vulnerability_scan_policy = each.value.vulnerability_scan_policy
}
