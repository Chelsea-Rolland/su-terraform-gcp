terraform {
    backend "gcs" {
        bucket  = var.bucket_name + "-" + var.app_environment
        prefix  = "terraform/${var.app_environment}/state"
    }
}