variable cloud_id {
  description = "Cloud"
}
variable folder_id {
  description = "Folder"
}
variable zone {
  description = "Zone"
  # Значение по умолчанию
  default = "ru-central1-a"
}
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
variable token {
  description = "token"
}
variable instance_count {
  description = "Count of application instances to create"
  default     = 1
}
variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}
variable db_disk_image {
  description = "Disk image for reddit db"
  default     = "reddit-db-base"
}
variable cidr {
  description = "Subnet"
  default     = "192.168.10.0/24"
}
variable environment {
  description = "Environment for prefix"
}
variable provision {
  description = "If true then created VMs will be provisioned by app and db"
  default     = true
}
