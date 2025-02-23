resource "nexus_security_saml" "security_saml" {
  for_each = var.nexus_security_saml

  idp_metadata                 = each.value.idp_metadata
  entity_id                    = each.value.entity_id
  validate_response_signature  = each.value.validate_response_signature
  validate_assertion_signature = each.value.validate_assertion_signature
  username_attribute           = each.value.username_attribute
  first_name_attribute         = each.value.first_name_attribute
  last_name_attribute          = each.value.last_name_attribute
  email_attribute              = each.value.email_attribute
  groups_attribute             = each.value.groups_attribute
}
