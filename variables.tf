variable "region" {
  description = "The AWS region where resources will be created"
  type = string
  default = "us-east-1"
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type = string
  default = "berlin-date-and-time-bucket-iu"
}

variable "origin" {
  description = "Origin and Target Origin ID"
  type = string
  default = "WebsiteOriginS3"
}

variable "index_document" {
  description = "The index document for the website"
  type = string
  default = "index.html"
}

variable "error_document" {
  description = "The error document for the website"
  type = string
  default = "error.html"
}

