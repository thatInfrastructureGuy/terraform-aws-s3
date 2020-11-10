output "s3_name" {
  description = "S3 bucket name"
  value       = aws_s3_bucket.bucket.bucket
}
