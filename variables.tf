variable "user_uuid" {
  description = "User UUID"
  type        = string
  validation {
    condition     = can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", var.user_uuid))
    error_message = "User UUID must be in the format of UUID (e.g., 123e4567-e89b-12d3-a456-426655440000)"
  }
}

variable "bucket_name" {
  description = "AWS S3 Bucket Name"
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9.-]{3,63}$", var.bucket_name)) && !can(regex("^[.-]|[-.]|[.]{2,}", var.bucket_name))
    error_message = "S3 bucket name must be between 3 and 63 characters, use only lowercase letters, numbers, hyphens, and periods. It cannot start or end with a period, and cannot have consecutive periods, hyphens, or a period at the beginning or end."
  }
}