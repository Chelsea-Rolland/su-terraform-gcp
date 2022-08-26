resource "random_integer" "randomInt" {
  min = 1111111
  max = 9999999
}

resource "google_compute_network" "vpc_network" {
  name                    = "${var.vpc_network_name}-${var.app_environment}"
  auto_create_subnetworks = "true"
}

resource "google_compute_instance" "vm_instance" {
  count        = var.vm_count
  name         = "${var.vm_instance_name}-${count.index + 1}"
  machine_type = var.vm_instance_machine_type

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }

  tags = [var.app_environment, var.location]
}

# Modules
module "cloud-storage" {
  source  = "terraform-google-modules/cloud-storage/google"
  version = "3.3.0"
  # insert the 3 required variables here
  names      = [var.bucket_name]
  prefix     = "${var.app_environment}-${random_integer.randomInt.id}"
  project_id = var.gcp_project_id
  location   = var.bucket_location
  versioning = {
    first = true
  }
  lifecycle_rules = [{
    condition = {
      age = var.changeObjStateAge
    }
    action = {
      type          = "SetStorageClass"
      storage_class = var.storage_class
    }
    }, {
    condition = {
      age        = var.deleteObjAge
      with_state = "ANY"
    }
    action = {
      type = "Delete"
    }
    }
  ]
}