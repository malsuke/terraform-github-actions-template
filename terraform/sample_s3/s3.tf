resource "aws_s3_bucket" "terraform_state" {
  bucket = "sample_s3_bucket_730335203034"
  lifecycle {
    prevent_destroy = true
  }
}
