provider "aws" {
  region = var.region
}

provider "aws" {
  alias  = "west"
  region = "us-west-1"
}

