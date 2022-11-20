resource "local_file" "pet" {
  filename = var.filename
  content  = "My favorite pet is Mr.Cat"
}

resource "random_pet" "my-pet" {
  prefix    = var.prefix
  separator = var.separator
  length    = var.length
}
