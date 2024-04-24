resource "aws_iam_role" "iam_for_lambda1" {
  name = "iam_for_lambda1"
  
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [ 
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid":""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "test_policy" {
  name = "lambda_sqs_s3_policy"
  role = aws_iam_role.iam_for_lambda1.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
        "sqs:ReceiveMessage",
        "sqs:DeleteMessage",
        "sqs:GetQueueAttributes"
        ],
        Effect   = "Allow"
        "Resource": "arn:aws:sqs:ap-south-1:339713080913:terraform_sqs_queue1"
      },
      {
        Action = [
        "s3:PutObject"
        ],
        Effect   = "Allow"
        "Resource": "*"
      },
      {
        Action = [
        "logs:*"
        
        ],
        Effect   = "Allow"
        "Resource": "*"
      },
    ]
  })
}