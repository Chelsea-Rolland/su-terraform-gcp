resource "random_integer" "randomInt" {
  min = 1111111
  max = 9999999
}

resource "google_storage_bucket" "tf-state" {
  name          = "terraform-${random_integer.randomInt.id}-state"
  location      = var.bucket_location
  force_destroy = true
  versioning {
    enabled = true
  }
}