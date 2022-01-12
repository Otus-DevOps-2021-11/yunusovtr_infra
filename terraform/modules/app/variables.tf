variable vm_zone {
  description = "VM zone"
  # Значение по умолчанию
  default = "ru-central1-a"
}
variable public_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
variable private_key_path {
  # Описание переменной
  description = "Path to the private key used for ssh access"
}
variable subnet_id {
  description = "Subnet"
}
variable instance_count {
  description = "Count of application instances to create"
  default = 1
}
variable app_disk_image {
  description = "Disk image for reddit app"
  default = "reddit-app-base"
}
