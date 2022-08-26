variable "app_environment" {
  type        = string
  description = "Project Specific Environment"
}

variable "gcp_project_id" {
  type        = string
  description = "GCP Project ID"
  default     = "<PROJECT_ID GOES HERE>"
  nullable    = false
}

variable "gcp_region" {
  type        = string
  description = "Name GCP Region"
  default     = "us-central1"
  nullable    = false
}

variable "gcp_zone" {
  type        = string
  description = "Name GCP Zone"
  default     = "us-central1-a"
  nullable    = false
}

variable "bucket_location" {
  type        = string
  description = "Bucket Location"
  default     = "US"
}