# yunusovtr_infra
yunusovtr Infra repository

## Домашняя работа cloud-testapp
testapp_IP = 62.84.127.24
testapp_port = 9292

## Startup script
Команда для запуска инстанса с автодеплоем:
yc compute instance create --name reddit-app --hostname reddit-app --memory=4 --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 --metadata serial-port-enable=1 --metadata-from-file user-data=startup_config.yml
