terraform {
  required_providers {
    netlify = {
      source  = "netlify/netlify"
      version = "~> 0.2"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }

  cloud {
    organization = "HUG-Ibadan1"   # replace with your HCP Terraform org

    workspaces {
      name = "netlify-challenge"     # replace with your HCP Terraform workspace
    }
  }
}

provider "netlify" {
  token = var.netlify_token
}

resource "random_pet" "site" {
  length = 2
}

resource "netlify_site" "demo" {
  name = "${var.site_prefix}-${random_pet.site.id}"
}

resource "netlify_deploy" "site_files" {
  site_id = netlify_site.demo.id
  dir     = "${path.module}/." # deploys your index.html
}

output "live_site_url" {
  value = netlify_site.demo.ssl_url
}
