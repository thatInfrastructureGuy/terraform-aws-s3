resource "aws_s3_bucket" "log_bucket" {
  bucket = join("", [var.name, "log-", random_string.random.result])
  acl    = "log-delivery-write"
}

