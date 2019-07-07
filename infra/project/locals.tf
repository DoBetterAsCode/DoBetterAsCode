locals {
  project_name = "dobetterascode"
  base_domain = "dobetterascode.com"

  full_domain = "${var.env == "prod" ? "${local.base_domain}" : "${var.env}.${local.base_domain}"}"
}