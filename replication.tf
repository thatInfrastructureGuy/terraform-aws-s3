resource "aws_s3_bucket" "destination" {
  bucket   = join("", ["replication-bucket-", random_string.random.result])
  provider = aws.west

  acl = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.mykey.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }

  versioning {
    enabled = true
  }
}
