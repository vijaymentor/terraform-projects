 provider "google" {
     credentials = file("gcp-account.json")
     project     = " perfect-tape-372908"
     region      = "europe-west4"
     zone        = "europe-west4-a"
}

# main.tf

resource "google_compute_instance" "default" {
  name         = "test"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  # To keep the setup simple you can set the network_interface to default
  # For Advance network setup refer to Point-7 : Setup Network and Firewall for virtual machine
  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
}
