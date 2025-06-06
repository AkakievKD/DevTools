variable "ad_user" {
  type = map(object({
    display_name              = string
    principal_name            = string
    sam_account_name          = string
    enabled                   = optional(bool)
    initial_password          = optional(string)
    cannot_change_password    = optional(bool)
    password_never_expires    = optional(bool)
    smart_card_logon_required = optional(bool)
    trusted_for_delegation    = optional(bool)
    city                      = optional(string)
    company                   = optional(string)
    container                 = optional(string)
    country                   = optional(string)
    department                = optional(string)
    description               = optional(string)
    division                  = optional(string)
    email_address             = optional(string)
    employee_id               = optional(string)
    employee_number           = optional(string)
    fax                       = optional(string)
    given_name                = optional(string)
    home_directory            = optional(string)
    home_drive                = optional(string)
    home_page                 = optional(string)
    home_phone                = optional(string)
    initials                  = optional(string)
    mobile_phone              = optional(string)
    office                    = optional(string)
    office_phone              = optional(string)
    organization              = optional(string)
    other_name                = optional(string)
    po_box                    = optional(string)
    postal_code               = optional(string)
    state                     = optional(string)
    street_address            = optional(string)
    surname                   = optional(string)
    title                     = optional(string)
    custom_attributes         = optional(string)
  }))
  default = {}
}