
# Terraform AWS SQS, S3, and Lambda Integration

This Terraform project demonstrates how to use Terraform to deploy AWS resources for an application that reads messages from an SQS queue using a Lambda function and puts the messages as JSON objects into an S3 bucket.
## Prerequisites
Before you begin, ensure you have the following:
- An AWS Account
- AWS CLI installed and configured with appropriate credentials.
- Terraform installed
- Visual Studio Code 

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

### 4. Test the Integration
- Send messages to the created SQS queue using AWS CLI or SDK.
- Monitor the S3 bucket for JSON objects representing the messages.
## Testing the Function
### 1. *Add Messages to Your Queue:*
- You can add messages to your SQS. UseAWSCLIorSDKtosendatest message to the SQS queue. 

### 2. *Monitor the Lambda Function:*
- Navigate to your Lambda Function in AWS portal.
- Click on "Monitor" to view the logs and verify that the function is triggered and processing messages.

### 3. *Verify S3 Bucket:*
- Navigate to your S3 Bucket in the AWS portal.
- Check if the messages are written correctly as JSON files.


## Cleanup
To avoid incurring charges, destroy the deployed resources after testing:
```bash
terraform destroy
```
