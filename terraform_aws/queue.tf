resource "aws_sqs_queue" "terraform_queue" {
  name                      = "terraform_sqs_queue1"
  delay_seconds             = 5
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10

}

resource "aws_lambda_event_source_mapping" "s3_lambda" {
  event_source_arn = aws_sqs_queue.terraform_queue.arn
  function_name = aws_lambda_function.test_lambda.arn
}