resource "aws_s3_bucket" "terraform_state" {
  bucket = "samples3bucket730335203034"
  lifecycle {
    prevent_destroy = true
  }
}
