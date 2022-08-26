provider "google" {
    project = var.gcp_project_id
    region  = var.gcp_region
    zone = var.gcp_zone
}

resource "random_integer" "randomInt" {
    min = 1111111
    max = 9999999
}

resource "google_storage_bucket" "tf-state" {
    name          = "${var.app_environment}-${random_integer.randomInt.id}-tfState"
    location      = var.bucket_location
    force_destroy = true
    versioning {
        enabled = true
    }
}