provider "aws" {
  region = "eu-west-1"
}

resource "aws_s3_bucket" "app_bucket" {
  bucket = "terraform-app-bucket-rsschool"
}

output "bucket_name" {
  value = aws_s3_bucket.app_bucket.bucket
}