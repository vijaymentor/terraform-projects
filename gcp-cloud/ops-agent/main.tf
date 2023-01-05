provider "google" {
  project = "perfect-tape-372908"
  region  = "us-central1"
}

resource "google_compute_instance" "server1" {
  name         = "test"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {

      labels = {
        my_label = "value"
      }
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    foo = "bar"
  }


  metadata_startup_script = "echo hi > /test.txt"

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    host        = self.network_interface[0].access_config[0].nat_ip
  }
  provisioner "remote-exec" {
    inline = [
      "curl -sSO https://dl.google.com/cloudagents/add-google-cloud-ops-agent-repo.sh",
      "sudo bash add-google-cloud-ops-agent-repo.sh --also-install"

    ]
  }

  provisioner "file" {
    source      = "config.yaml"
    destination = "/etc/google-cloud-ops-agent/config.yaml"
  }

  provisioner "remote-exec" {
    inline = [
      "systemctl restart google-cloud-ops-agent"
    ]
  }
}
