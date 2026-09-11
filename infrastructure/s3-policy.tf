data "aws_iam_policy_document" "resume_bucket_policy" {
  statement {
    sid    = "PublicReadGetObject"
    effect = "Allow"

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject"
    ]
    resources = [
      "${aws_s3_bucket.resume.arn}/*"
    ]
  }
}
resource "aws_s3_bucket_policy" "resume" {
  bucket = aws_s3_bucket.resume.id
  policy = data.aws_iam_policy_document.resume_bucket_policy.json
}
