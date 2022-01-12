provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
  version   = "~> 0.35"
}

module "app" {
  source          = "./modules/app"
  vm_zone         = var.vm_zone
  public_key_path = var.public_key_path
  private_key_path = var.private_key_path
  app_disk_image  = var.app_disk_image
  subnet_id       = var.subnet_id
  instance_count  = var.instance_count
}

module "db" {
  source          = "./modules/db"
  public_key_path = var.public_key_path
  db_disk_image   = var.db_disk_image
  subnet_id       = var.subnet_id
}
