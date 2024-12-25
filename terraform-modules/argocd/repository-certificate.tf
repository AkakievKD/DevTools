resource "argocd_repository_certificate" "https_certificates" {
  for_each = { for key, value in var.argocd_repository_certificate : key => value if can(value.https) && value.https != null }

  https {
    server_name = each.value.https.server_name
    cert_data   = each.value.https.cert_data
  }
}

resource "argocd_repository_certificate" "ssh_certificates" {
  for_each = { for key, value in var.argocd_repository_certificate : key => value if can(value.ssh) && value.ssh != null }

  ssh {
    server_name  = each.value.ssh.server_name
    cert_data    = each.value.ssh.cert_data
    cert_subtype = each.value.ssh.cert_subtype
  }
}

