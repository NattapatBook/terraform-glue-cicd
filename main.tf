# resource "aws_s3_bucket" "test-tf-bucket" {
#   bucket = "my-tf-test-bucket-tmg-poc"

#   tags = {
#     Environment = "poc"
#   }
# }


# Added new liune of CODE.

resource "aws_s3_object" "api_ingest" {
  key                    = "scripts/api_ingest${var.py_name}.py"
  bucket                 = "aws-glue-assets-863518427397-ap-southeast-1"
  source                 = "src/api_ingest.py"
  etag                   = filemd5("src/api_ingest.py")
#   server_side_encryption = "aws:kms"
}

resource "aws_glue_job" "glue_api_ingest_job" {
  name     = "API Ingestion ${var.deploy_env}"
  role_arn = "arn:aws:iam::863518427397:role/tmg-glue-service-role"
  glue_version = "5.0"
  worker_type = "G.1X"
  number_of_workers = 2

  command {
    script_location = "s3://aws-glue-assets-863518427397-ap-southeast-1/${aws_s3_object.api_ingest.key}"
  }

  default_arguments = {
    "--enable-job-insights" = "true"
    "--enable-metrics"      = "true"
    "--job-bookmark-option" = "job-bookmark-enable"
  }
}