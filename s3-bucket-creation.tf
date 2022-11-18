provider "aws" {
  profile    = "Terraform-user"
  access_key = "AKIAXRBAMKA2T2JG3CDR"
  secret_key = "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"
  region     = "eu-west-1"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "my-tf-test-bucket-06-05-197-narasimha-raju"
  tags = {
    Name        = "My-Bucket"
    Environment = "Test"
  }
}
