#Main config

provider "google" {
  project = var.project
  region  = var.region
  zone    = "${var.region}-${var.zone}"
}


resource "google_compute_instance" "vm_instance" {
  count        = var.instances
  name         = var.vm_name
  machine_type = var.vm_size

  boot_disk {
    initialize_params {
      image = var.vm_image
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network       = var.network
    access_config {
    }
  }
  metadata = {
    ssh-keys = join("\n", [for user, key in var.ssh_keys : "${user}:${key}"])
  }
  metadata_startup_script = var.startup_script
}
