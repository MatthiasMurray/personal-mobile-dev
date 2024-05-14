resource "google_cloud_functions_function" "write_to_bucket" {
  name		= "write-to-bucket-function"
  entry_point	= "write_to_bucket"
  runtime	= "python39"

  source_archive_bucket = google_storage_bucket.function_source.name
  source_archive_object = google_storage_bucket_object.function_code.name

  trigger_http = true
  event_trigger {
    event_type = "google.pubsub.topic.publish"
    resource   = google_pubsub_topic.event_topic.id
  }
}

resource "google_storage_bucket" "function_source" {
  name = "my-function-source-bucket"
}

resource "google_storage_bucket_object" "function_code" {
  name = "function.zip"
  bucket = google_storage_bucket.function_source.name
  source = "path/to/your/function.zip"
}

resource "google_pubsub_topic" "event_topic" {
  name = "event-topic"
}

resource "google_project_iam_member" "storage_admin" {
  project	= var.project_id
  role		= "roles/storage.admin"
  member	= "serviceAccount:${var.cicd_service_account_email}"
}

resource "google_project_iam_member" "functions_developer" {
  project	= var.project_id
  role		= "roles/cloudfunctions.developer"
  member	= "serviceAccount:${var.cicd_service_account_email}"
}

resource "google_project_iam_member" "pubsub_admin" {
  project	= var.project_id
  role		= "roles/pubsub.admin"
  member	= "serviceAccount:${var.cicd_service_account_email}"
}
