terraform {
  backend "s3" {
    endpoint          = "storage.yandexcloud.net"
    bucket            = "tf-states-yunusovtr"
    region            = "ru-central1"
    key               = "prod.tfstate"
    dynamodb_endpoint = "https://docapi.serverless.yandexcloud.net/ru-central1/b1g2700eddislgm2l4ea/etnmcpdpnv1mpfs3415r"
    dynamodb_table    = "tflock"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
