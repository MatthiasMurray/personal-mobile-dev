variable "project_env" {
  type        = string
  description = "Project environment name"
  default     = "dev"
}

variable "project_id" {
  type        = string
  description = "Target GCP project ID"
  default     = "personal-gcp-dev"
}

variable "region" {
  type        = string
  description = "The GCP region for deployment"
  default     = "us-central1"
}

variable "credentials_file_path" {
  type        = string
  description = "Path to GCP service account JSON"
  default     = "~/new-service-account-cicd-key.json"
}

variable "bucket_name" {
  type        = string
  description = "The name of the GCP bucket"
  default     = "hello-world-bucket"
}

variable "cloud_function_name" {
  type        = string
  description = "The name of the cloud function"
  default     = "hello-world-function"
}
