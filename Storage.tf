provider "aws" {
        access_key = "AKIAIOBWVSLOXKKG6RNBQ"
        secret_key = "4O28N92r2bwnEKib4+3gFYQjeXGwDbkHNoeoLPR5B"
        region = "us-east-1d"
        }


resource "aws_s3_bucket" "Sky_s3" {
bucket = "Sky_s3_01"
versioning {
      enabled = true
           }
lifecycle {
      prevent_destroy = true
          }
}
