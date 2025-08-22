variable "netlify_token" {
  type        = string
  description = "Netlify Personal Access Token"
  sensitive   = true
}

variable "site_prefix" {
  type        = string
  description = "Welcome to Terraform 30-days Chanllenge"
  default     = "hug-ibadan-demo"
}
