variable "project_id" {
  description	= "The project ID to host the resources"
  type		= string
}

variable "region" {
  description	= "The region where the resources will be created"
  default	= "us-central1"
}

variable "bucket_name" {
  description	= "Name of the bucket to be used for storing function code and messages"
  type		= string
}

variable "function_name" {
  description	= "Name of the Cloud Function"
  type		= string
}
