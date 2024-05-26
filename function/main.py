from google.cloud import storage
import os

def hello_world(request):
    bucket_name = os.environ['BUCKET_NAME']
    file_name = "hello_world.txt"

    storage_client = storage.Client()
    bucket = storage_client.bucket(bucket_name)
    blob = bucket.blob(file_name)

    blob.upload_from_string("Hello World")

    return f'Hello World written to {file_name} in {bucket_name}'
