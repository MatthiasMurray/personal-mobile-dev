provider "google" {
  credentials = file("~/sa.json")
  project = "personal-gcp-dev"
  region = "us-central1"
}

terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "~> 3.5"
    }
  }
}
