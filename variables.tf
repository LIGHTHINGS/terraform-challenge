variable "netlify_token" {
  description = "Personal access token for Netlify API"
  type        = string
  sensitive   = true
}

variable "github_repo" {
  description = "The GitHub repository to link with Netlify (e.g. username/repo)"
  type        = string
  default = "https://github.com/LIGHTHINGS/terraform-challenge.git"
}

variable "branch" {
  description = "The branch in the GitHub repository to deploy"
  type        = string
  default     = "main"
}

variable "site_prefix" {
  description = "Simple Terraform Demo Website"
  type        = string
  default     = "hug-demo"
}
