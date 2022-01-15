output "access_key" {
  value = yandex_iam_service_account_static_access_key.sa-static-key.access_key
}

output "secret_key" {
  value = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
}

output "bucket" {
  value = yandex_storage_bucket.states_bucket.bucket
}

# output "dynamodb_endpoint" {
#   value = yandex_ydb_database_serverless.lock_database.document_api_endpoint
# }

output "region" {
  value = "ru-central1"
}

output "endpoint" {
  value = "storage.yandexcloud.net"
}
