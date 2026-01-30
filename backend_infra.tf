terraform {
  backend "s3" {
    bucket     = "finalq"
    key        = "terraform.tfstate"
    region     = "us-east-1"
    use_lockfile = true
  }
}
