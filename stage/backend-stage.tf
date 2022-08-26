terraform {
    backend "gcs" {
        // BACKEND CANT HAVE VARIABLES MUST BE A STRING
        bucket  = "${var.bucket_name}-${var.app_environment}"
        prefix  = "terraform/stage/state"
    }
}