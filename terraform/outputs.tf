output "function_name" {
  value		= google_cloud_functions.write_to_bucket.name
  description	= "The name of the deployed Cloud Function"
}

output "bucket_name" {
  value		= google_storage_bucket.function_source.name
  description	= "The name of the bucket used for storing function code"
}

output "pubsub_topic_name" {
  value		= google_pubsub_topic.event_topic.name
  description	= "The name of the Pub/Sub topic used for triggering the function"
}
