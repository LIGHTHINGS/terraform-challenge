terraform {
  required_providers {
    netlify = {
      source  = "AegirHealth/netlify"
      version = "0.6.12" # <-- check latest version on registry
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }

  cloud {
    organization = "HUG-Ibadan1"   # your HCP Terraform org
    workspaces {
      name = "terraform-challenge" # your HCP Terraform workspace
    }
  }
}

provider "netlify" {
  token = var.netlify_token
}

resource "random_pet" "site" {
  length = 2
}

# Creates a Netlify site linked to a GitHub repo
resource "netlify_site" "demo" {
  name = "${var.site_prefix}-${random_pet.site.id}"

  # repo {
  #   provider      = "github"
  #   repo_path     = var.github_repo   # e.g. "yourusername/your-repo"
  #   repo_branch   = var.branch        # e.g. "main"
  #   deploy_key_id = netlify_deploy_key.key.id
  # }
  repo {
  provider    = "github"
  repo_path   = "https://github.com/LIGHTHINGS/terraform-challenge.git"
  repo_branch = "main"
}

}

# Creates a deploy key for GitHub access
resource "netlify_deploy_key" "key" {}
