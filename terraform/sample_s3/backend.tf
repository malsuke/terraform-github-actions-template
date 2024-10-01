terraform {
  required_version = ">= 1"

  backend "s3" {
    bucket         = "terraform-state-bucket"
    key            = "sample_s3.tfstate"
    region         = "ap-northeast-1"
    dynamodb_table = "terraform-state-lock"
  }
}
