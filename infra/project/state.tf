terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "DoBetterAsCode"

    workspaces {
      prefix = "DoBetterAsCode-"
    }
  }
}

