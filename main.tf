
resource "teamcity_ssh_key" "shared_key" {
  project_id  = teamcity_project.project_a.id
  name        = "GitHubSharedKey"
  private_key = file(var.github_ssh_private_key_path)
}

resource "teamcity_project" "project_a" {
  name = "Project A"
}

resource "teamcity_project" "project_b" {
  name = "Project B"
}

resource "teamcity_vcsroot" "project_a" {
  name       = "ProjectAVCSRoot"
  project_id = teamcity_project.project_a.id

  git = {
    url          = "git@github.com:AntonAleksandrov13/terraform-teamcity-test-vcs-sources.git"
    branch       = "main"
    auth_method  = "TEAMCITY_SSH_KEY"
    uploaded_key = teamcity_ssh_key.shared_key.name
  }
}

resource "teamcity_versioned_settings" "project_a" {
  project_id       = teamcity_project.project_a.id
  vcsroot_id       = teamcity_vcsroot.project_a.id
  settings         = "useFromVCS"
  allow_ui_editing = false
  show_changes     = false
}