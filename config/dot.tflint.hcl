# -*- mode: terraform -*-

plugin "google" {
  enabled = true
  version = "0.30.0"
  source  = "github.com/terraform-linters/tflint-ruleset-google"
}

plugin "sheldon" {
  enabled = true
  version = "0.0.7"
  source  = "github.com/0x416e746f6e/tflint-ruleset-sheldon"
}

plugin "sort" {
  enabled = true
  version = "0.0.7"
  source  = "github.com/thespags/tflint-ruleset-sort"
}

plugin "terraform" {
  enabled = true
  version = "0.14.1"
  source  = "github.com/terraform-linters/tflint-ruleset-terraform"
  preset  = "all"
}

# ------------------------------------------------------------------------------

rule "sheldon_spacing" {
  enabled = false # prefer source and version together
}
