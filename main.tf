resource "aws_s3_bucket" "test-tf-bucket" {
  bucket = "my-tf-test-bucket-tmg-poc"

  tags = {
    Environment = "poc"
  }
}

# resource "aws_s3_object" "example" {
#   key                    = "someobject"
#   bucket                 = aws_s3_bucket.examplebucket.id
#   source                 = "index.html"
#   server_side_encryption = "aws:kms"
# }