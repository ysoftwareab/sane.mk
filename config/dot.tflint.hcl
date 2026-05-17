# -*- mode: terraform -*-

plugin "google" {
  enabled = true
  version = "0.30.0"
  source  = "github.com/terraform-linters/tflint-ruleset-google"
}

plugin "sort" {
  enabled = true
  version = "0.0.7"
  source  = "github.com/thespags/tflint-ruleset-sort"

  resource "random_id" {
    key_attributes = []
  }
}

plugin "terraform" {
  enabled = true
  version = "0.14.1"
  source  = "github.com/terraform-linters/tflint-ruleset-terraform"
  preset  = "all"
}

# ------------------------------------------------------------------------------

rule "sort_spacing" {
  enabled = false # prefer source and version together, issues with multilines
}

rule "sort_sorting" {
  enabled = false # issues with multilines
}
