terraform {
  required_version = ">= 1.11.0"

  backend "s3" {
    bucket       = "terraform-state-bucket-730335203034111"
    key          = "public_s3.tfstate"
    region       = "ap-northeast-1"
    use_lockfile = true
  }
}
