terraform {
  backend "s3" {
    bucket = "mybackend9256"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
