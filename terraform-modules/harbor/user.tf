resource "harbor_user" "user" {
  for_each  = { for key, value in var.harbor_user : key => value }
  username  = each.key
  password  = each.value.password
  full_name = each.value.full_name
  email     = each.value.email
  admin     = each.value.admin
  comment   = each.value.comment
}
