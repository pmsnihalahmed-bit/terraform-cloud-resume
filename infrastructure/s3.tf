resource "aws_s3_bucket" "resume" {
  bucket        = var.bucket_name
  force_destroy = true
}
resource "aws_s3_bucket_public_access_block" "resume" {
  bucket                  = aws_s3_bucket.resume.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
