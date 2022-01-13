provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
  version   = "0.35"
}

// Create SA
resource "yandex_iam_service_account" "sa" {
  folder_id = var.folder_id
  name      = "tf-service-account"
}

// Grant permissions
resource "yandex_resourcemanager_folder_iam_member" "sa-editor" {
  folder_id = var.folder_id
  role      = "editor"
  member    = "serviceAccount:${yandex_iam_service_account.sa.id}"
}

// Create Static Access Keys
resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = yandex_iam_service_account.sa.id
  description        = "static access key for object storage"
}

// Use keys to create bucket
resource "yandex_storage_bucket" "states_bucket" {
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket     = "tf-states-yunusovtr"
}

// Create database for lock, but can't create table yet
# resource "yandex_ydb_database_serverless" "lock_database" {
#   name      = "tf-meta-db-yunusovtr"
#   folder_id = "${data.yandex_resourcemanager_folder.test_folder.id}"
# }
