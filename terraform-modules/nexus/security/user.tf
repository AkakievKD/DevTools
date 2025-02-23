resource "nexus_security_user" "security_user" {
  for_each = var.nexus_security_user

  userid    = each.value.userid
  firstname = each.value.firstname
  lastname  = each.value.lastname
  email     = each.value.email
  password  = each.value.password
  roles     = each.value.roles
  status    = each.value.status
}
