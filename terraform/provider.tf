provider "google" {
  credentials = file("~/service-account-cicd-key.json")
  project = "personal-gcp-dev"
  region = "us-central1"
}

terraform {
  required_version = ">= 1.0.0"

  required_providers {
    google = {
      source = "hashicorp/google"
      version = "~> 3.90.1"
    }
  }
}
