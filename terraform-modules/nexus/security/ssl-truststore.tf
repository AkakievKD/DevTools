data "nexus_security_ssl" "ssl_cert" {
  for_each = var.nexus_security_ssl_truststore

  host = each.value.host
  port = each.value.port
}

resource "nexus_security_ssl_truststore" "security_ssl_truststore" {
  for_each = var.nexus_security_ssl_truststore

  pem = data.nexus_security_ssl.ssl_cert[each.key].pem
}
