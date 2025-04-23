variable "teamcity_token" {
  type = string
  description = "Token which will be used to interact with the TeamCity server"
  sensitive = true
}

variable "github_ssh_private_key_path" {
  type      = string
  description = "A local path to SSH private key for GitHub repository"
  default = "/Users/Anton.Aleksandrov/trash/terraform-provider-teamcity-data/github_key"
}