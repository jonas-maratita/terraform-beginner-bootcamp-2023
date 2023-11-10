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

variable "index_html_filepath" {
  description = "Path to the index.html file"
  type        = string

  validation {
    condition     = fileexists(var.index_html_filepath)
    error_message = "The specified path for index.html does not exist."
  }
}

variable "error_html_filepath" {
  description = "Path to the error.html file"
  type        = string

  validation {
    condition     = fileexists(var.error_html_filepath)
    error_message = "The specified path for error.html does not exist."
  }
}

variable "content_version" {
  description = "The content version should be a positive integer starting at 1"
  type        = number

  validation {
    condition     = var.content_version > 0 && floor(var.content_version) == var.content_version
    error_message = "The content_version must be a positive integer starting at 1"
  }
}

variable "assets_path" {
  description = "Path to assets folder"
  type = string
}