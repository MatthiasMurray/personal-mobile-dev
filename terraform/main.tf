resource "google_storage_bucket" "bucket" {
  name          = var.bucket_name
  location      = var.region
  force_destroy = true
}

resource "google_cloudfunctions_function" "cf" {
  name        = var.cloud_function_name
  description = "A function to write 'Hello World' to a bucket"
  runtime     = "python39"

  available_memory_mb   = 256
  source_archive_bucket = google_storage_bucket.bucket.name
  source_archive_object = google_storage_bucket_object.source.name

  entry_point  = "hello_world"
  trigger_http = true

  environment_variables = {
    BUCKET_NAME = google_storage_bucket.bucket.name
  }

  service_account_email = "terraform-admin-sa@cicd-personal-project.iam.gserviceaccount.com"
}

resource "google_storage_bucket_object" "source" {
  name   = "source-archive.zip"
  bucket = google_storage_bucket.bucket.name
  source = "functions/zipped/source-archive.zip"
}

resource "google_cloudfunctions_function_iam_member" "invoker" {
  project        = google_cloudfunctions_function.default.project
  region         = google_cloudfunctions_function.default.region
  cloud_function = google_cloudfunctions_function.default.name

  role   = "roles/cloudfunctions.invoker"
  member = "serviceAccount:terraform-admin-sa@cicd-personal-project.iam.gserviceaccount.com"
}

resource "google_cloud_scheduler_job" "scheduler" {
  name      = "function-scheduler"
  schedule  = "30 18 27 5 *"
  time_zone = "America/Denver"

  http_target {
    http_method = "GET"
    url         = google_cloudfunctions_function.cf.https_trigger_url
  }
}
