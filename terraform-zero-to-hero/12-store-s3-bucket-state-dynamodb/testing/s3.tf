provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "tf_course" {

  bucket = "cnl-state-buckets"
  acl    = "private"
}
