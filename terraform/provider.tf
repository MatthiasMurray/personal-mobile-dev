terraform {
  required_version = ">= 1.1.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.5"
    }
  }
}

provider "google" {
  credentials = file(var.credentials_file_path)
  project     = "personal-gcp-${var.project_env}"
  region      = var.region
}
