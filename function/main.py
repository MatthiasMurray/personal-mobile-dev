from google.cloud import storage
import base64
import datetime

def write_to_bucket(event, context):
    """Triggered from a message on a Cloud Pub/Sub topic"""
    message_data = base64.b64decode(
            event['data']
            ).decode('utf-8')
    print(f'Received message: {message_data}')

    # Initialize a storage client
    storage_client = storage.Client()
    bucket_name = 'your-bucket-name'
    bucket = storage_client.bucket(bucket_name)

    # Create a blob and upload
    blob_name = f"messages/message-{datetime.datetime.now().isoformat()}.txt"
    blob = bucket.blob(blob_name)
    blob.upload_from_string(message_data)

    print(f"Data written to {blob_name} in bucket {bucket_name}")
