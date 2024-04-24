
# Terraform AWS SQS, S3, and Lambda Integration

This Terraform project demonstrates how to use Terraform to deploy AWS resources for an application that reads messages from an SQS queue using a Lambda function and puts the messages as JSON objects into an S3 bucket.

## Architecture Overview
The architecture consists of several AWS services working together:

#### 1. AWS Lambda Functions:
- These are stateless functions that execute code in response to events triggered by other AWS services, such as messages arriving in an SQS queue.
- Lambda functions are used to process incoming messages from the SQS queue and upload processed data to an S3 bucket.
#### 2. Amazon SQS (Simple Queue Service):
- SQS is used as a reliable message queue to decouple the message producer (sender) from the message consumer (receiver).
- The main queue receives messages containing data that needs to be processed by Lambda functions.
#### 3. Amazon S3 (Simple Storage Service):
- S3 is a scalable object storage service used to store processed data in JSON format.
- Lambda functions upload the processed data (in JSON) to designated S3 buckets.
## Design Patterns
#### 1. Event-Driven Architecture:
- The system follows an event-driven architecture where Lambda functions are triggered by events (SQS messages).
- This pattern enables loose coupling between components and supports asynchronous processing.
#### 2. Decoupling with Message Queue (SQS):
- SQS acts as a message queue to decouple the message producer (which sends messages to the queue) from the message consumer (Lambda functions that process messages).
- Decoupling ensures that the producer and consumer can operate independently and at their own pace, improving scalability and fault tolerance.
####  3. Idempotent Processing:
- Lambda functions are designed to process messages idempotently, meaning that processing the same message multiple times produces the same result.
- This ensures that even if a message is processed more than once (due to retries or failures), the outcome remains consistent.
####  4. Error Handling and Retries:
- Implement error handling and retry mechanisms within Lambda functions to handle transient failures gracefully.
- Use AWS Lambda's built-in retry behavior and implement exponential backoff strategies to manage retries effectively.
#### 5. Data Transformation (JSON Format):
- Messages processed by Lambda functions are transformed into JSON format before being stored in S3.
- JSON provides a standardized and structured data format, making it easier for downstream systems to consume and process the data.
#### 6. Infrastructure as Code (Terraform):
- Use Terraform for provisioning and managing AWS infrastructure as code (IaC).
- Infrastructure definitions are version-controlled, allowing for reproducible deployments and infrastructure changes.
## Detailed Workflow
 1. Message Producer (external system) sends messages containing data to the SQS queue.
2. SQS Queue receives and stores incoming messages.
3. Lambda Triggers:
- Lambda functions are triggered by messages arriving in the SQS queue.
- Each Lambda function processes a single message (or batch of messages) retrieved from the queue.
4. Data Processing:
- Lambda functions process incoming messages (e.g., data transformation, validation, enrichment).
- Processed data is formatted into JSON.
5. Data Storage:
- Lambda functions upload the processed data (in JSON format) to designated S3 buckets.
- S3 provides durable and scalable storage for the processed data.
## Benefits
- *Scalability* : Serverless architecture automatically scales based on workload demands.
- *Cost-Effectiveness* : Pay only for the compute resources used during execution.
- *Reliability* : Leveraging managed services (SQS, Lambda, S3) ensures high availability and fault tolerance.
- *Simplicity* : Simplified infrastructure management and reduced operational overhead.


## Prerequisites
Before you begin, ensure you have the following:
- Visual Studio Code 
- An AWS Account and an AWS IAM user with the necessary permissions for creating resources like Lambda functions, SQS queues and S3 buckets.
- AWS CLI installed on your machine and configured with the credentials of the IAM user.
- Setup Terraform in Visual Studio Code.

## Installation

Install the dependencies
```bash
pip install -r requirements.txt
```

## Setup Instructions

Follow these steps to deploy the AWS infrastructure using Terraform:

### 1. Clone the Repository
Clone this GitHub repository to your local machine:

```bash
git clone https://github.com/KRDhyana/SQS-Lambda-S3.git
cd terraform-SQS-Lambda-S3 
```
### 2. Initialize Terraform
Initialize the Terraform configuration:
```bash
terraform init  
```

### 3. Deploy the Infrastructure
Apply the Terraform configuration to deploy the AWS resources:
```bash
terraform apply  
```
Review the plan, and if everything looks good, type `yes` to confirm and deploy the resources.

## Testing the Function
### 1. *Add Messages to Your Queue:*
- You can add messages to your SQS. Use AWS CLI or SDK to send a test message to the SQS queue. 

### 2. *Monitor the Lambda Function:*
- Navigate to your Lambda Function in AWS portal.
- Click on "Monitor" to view the logs and verify that the function is triggered and processing messages.

### 3. *Verify S3 Bucket:*
- Navigate to your S3 Bucket in the AWS portal.
- Select the json object and then click on OPEN button. The s3 object will be downloaded to your local machine.
- Now open the file and you will be able to see the message that you have passed to SQS.



## Cleanup
To avoid incurring charges, destroy the deployed resources after testing:
```bash
terraform destroy
```
