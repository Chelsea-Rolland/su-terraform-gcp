terraform {
    backend "gcs" {
        // BACKEND CANT HAVE VARIABLES MUST BE A STRING
        bucket  = "<INSERT BUCKET NAME HERE>"
        prefix  = "terraform/dev/state"
    }
}