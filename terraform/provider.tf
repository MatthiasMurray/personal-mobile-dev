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
  credentials = ${{ secrets.GCP_SA_KEY }}
  project     = "personal-gcp-dev"
  region      = "us-central1"
}
