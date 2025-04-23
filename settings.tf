terraform {
  required_providers {
    teamcity = {
      source = "jetbrains/teamcity"
    }
  }
}

provider "teamcity" {
  host = "https://teamcity-terraform-demo.teamcity.com"
  token = var.teamcity_token
}