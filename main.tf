resource "aws_s3_bucket" "test-tf-bucket" {
  bucket = "my-tf-test-bucket"

  tags = {
    Environment = "poc"
  }
}