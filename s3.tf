resource "aws_s3_bucket" "b" {
  bucket = "mytask-terraform-s3-bucket1"

  tags = {
    Name        = "mytask-terraform-s3-bucket1"
    Environment = "Dev"
  }
}