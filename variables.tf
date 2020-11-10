variable "name" {
  description = "Bucket Name Prefix"
  default     = "bucket-"
  type        = string
}

variable "region" {
  description = "AWS Region"
  default     = "us-east-1"
  type        = string
}

variable "tags" {
  type        = map(string)
  description = "Tags for S3 bucket"
  default = {
    Terraform = "true"
  }
}
