resource "google_compute_disk" "default" {
  image = "centos-cloud/centos-7"
  name  = "test-disk"
  type  = "pd-ssd"
  zone  = "us-central1-a"

  size = "20"
  labels = {
    environment = "dev"
  }
  physical_block_size_bytes = 4096
}
