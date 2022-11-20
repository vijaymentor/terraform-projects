resource "local_file" "pet" {
  filename        = "vijay.txt"
  content         = "We love more pets!!"
  file_permission = "0777"
}
