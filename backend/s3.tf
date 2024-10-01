resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-state-bucket-730335203034"
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_versioning" "versioning_enabled" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}
