resource "aws_s3_bucket" "test-tf-bucket" {
  bucket = "my-tf-test-bucket-tmg-poc"

  tags = {
    Environment = "poc"
  }
}

resource "aws_s3_object" "api_ingest" {
  key                    = "scripts/api_ingest.py"
  bucket                 = "aws-glue-assets-863518427397-ap-southeast-1"
  source                 = "src/api_ingest.py"
#   server_side_encryption = "aws:kms"
}