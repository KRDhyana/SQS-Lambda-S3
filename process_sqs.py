import boto3
import json

def lambda_handler(event, context):
    try:
        # Extract message from the SQS event
        message = event['Records'][0]['body']
        print(f"Received message: {message}")

        # Extract message ID to use as filename
        filename = event['Records'][0]['messageId']

        # Upload the JSON file to S3 bucket
        s3 = boto3.resource('s3')
        bucket_name = 'mytask-terraform-s3-bucket1'
        s3_filename = f"{filename}.json"
        s3.meta.client.upload_file('/tmp/sqs.json', bucket_name, s3_filename)
        print(f"Uploaded file '{s3_filename}' to S3 bucket '{bucket_name}'")

        return {
            "statusCode": 200,
            "body": json.dumps("S3 upload successful")
        }
    except Exception as e:
        return {
            "statusCode": 500,
            "body": json.dumps(f"S3 upload failed: {e}")
        }
