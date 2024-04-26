data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "${path.module}/process_sqs.py"
  output_path = "${path.module}/process_sqs.zip"
}

resource "aws_lambda_function" "test_lambda" {
  
  function_name = "terraform_lambda_function1"
  filename      = data.archive_file.lambda_zip.output_path
  role          = aws_iam_role.iam_for_lambda1.arn
  handler       = "process_sqs.lambda_handler"

  source_code_hash = filebase64sha256(data.archive_file.lambda_zip.output_path)

  runtime = var.runtime
  
} resource "lambda" "name" {
  jsonencode hi {
    web some shift yes no
    terraform {
      ready
      Get
      Set 
      go
      
    }
  }
}