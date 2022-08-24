variable "app_environment" {
  type= string
  description = "Project Specific Environment"
}

variable "project_id" {
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

variable "bucket_name" {
  type        = string
  description = "List of bucket names with the project id"
}

variable "storage_class" {
  type        = string
  description = "The storage class of the Storage Bucket to create"
  default = "COLDLINE"
}

variable "vpc_network_name" {
  type        = string
  description = "Name of the VPC Network"
}

variable "vm_instance_name" {
  type        = string
  description = "Name of the VM Instance"
}

variable "vm_instance_machine_type" {
  type        = string
  description = "Machine type for the VM Instance"
  sensitive   = true
}

variable "bucket_location" {
  type        = string
  description = "Bucket Location"
  default = "US"
}

variable "vm_count" {
  type = number
  description = "Number of Desired VM Instances"
  default = 1
}

variable "location" {
  type = string
  description = "Where the vm is housed"
  default = "WEB"
}

variable "deleteObjAge" {
  type = number
  description = "Days from Creation Date to delete object"
}

variable "changeObjStateAge" {
  type = number
  description = "Days from Creation Date to change object storage class"
}