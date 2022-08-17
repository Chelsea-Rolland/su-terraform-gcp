# Resources

# Modules

# VPC

# Cloud Storage Bucket Module
module "cloud-storage" {
  source  = "terraform-google-modules/cloud-storage/google"
  version = "3.3.0"
  # insert the 3 required variables here
  names      = [var.bucket_name]
  prefix     = "demo"
  project_id = var.project_id
  lifecycle_rules = [{
    condition = {
      age = 5
    }
    action = {
      type = "Delete"
    }
    condition = {
      age = 3
    }
    action = {
      type          = "SetStorageClass"
      storage_class = var.storage_class
    }
  }]
}

# Cloud Run Module
module "cloud_run" {
  source  = "GoogleCloudPlatform/cloud-run/google"
  version = "~> 0.2.0"

  # Required variables
  service_name           = var.cloud_run_service_name
  project_id             = var.project_id
  location               = var.cloud_run_location
  image                  = var.cloud_run_image
  env_vars               = [{}]
  env_secret_vars        = [{}]
}

# Cloud VM Instances

