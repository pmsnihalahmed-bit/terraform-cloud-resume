variable "aws_region" {
  description = "AWS region where regional infrastructure will be created."
  type        = string
  default     = "ap-south-2"
}
variable "bucket_name" {
  description = "Globally unique name for the resume s3 bucket"
  type        = string
}
