resource "random_string" "random" {
  length  = 8
  lower   = true
  upper   = false
  special = false
}

resource "aws_s3_bucket" "bucket" {
  bucket = join("", [var.name, random_string.random.result])
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.mykey.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }

  //  grant {
  //    id          = data.aws_canonical_user_id.current_user.id
  //    type        = "CanonicalUser"
  //    permissions = ["FULL_CONTROL"]
  //  }

  logging {
    target_bucket = aws_s3_bucket.log_bucket.id
    target_prefix = "log/"
  }

  replication_configuration {
    role = aws_iam_role.replication.arn

    rules {
      prefix = "foo"
      status = "Enabled"

      destination {
        bucket        = aws_s3_bucket.destination.arn
        storage_class = "STANDARD"
      }
    }
  }

  versioning {
    enabled = true
  }
}
