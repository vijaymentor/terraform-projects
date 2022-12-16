# create s3 bucket

resource "aws_s3_bucket" "mybucket" {
  bucket = "cnlmybucket1234"
  versioning {
    enabled = true
  }

}

resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.mybucket.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
# create dynamodb file to change the statefile at a time one person

resource "aws_dynamodb_table" "statelock" {
  name         = "state-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LOCKID"

  attribute {
    name = "LOCKID"
    type = "S"
  }
}

