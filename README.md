# yunusovtr_infra
yunusovtr Infra repository

## Домашняя работа № 5
### Подключение одной строкой
ssh -J appuser@51.250.6.233 appuser@10.128.0.28

### Вариант решения для подключения из консоли по команде `ssh someinternalhost`
Внести в ~/.ssh/config строки:

Host bastion
  HostName 51.250.6.233
  User appuser
Host someinternalhost
  HostName 10.128.0.28
  User appuser
  ProxyJump bastion

Затем можно подключаться командой
ssh someinternalhost

### Дополнительное задание Lets Encrypt
https://51.250.6.233.sslip.io/

### Pritunl VPN
Для bastion использован образ Ubuntu 20.03 т.к. методичка устарела
bastion_IP = 51.250.6.233
someinternalhost_IP = 10.128.0.28

## Домашняя работа № 6

### Домашняя работа cloud-testapp
testapp_IP = 51.250.7.57
testapp_port = 9292

### Startup script
Команда для запуска инстанса с автодеплоем:
yc compute instance create --name reddit-app --hostname reddit-app --memory=4 --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 --metadata serial-port-enable=1 --metadata-from-file user-data=startup_config.yml

## Домашняя работа № 7: Сборка образов ВМ при помощи Packer

### Что сделано
 - Создан сервисный аккаунт для Packer
 - Создан и подготовлен файл-шаблон Packer ubuntu16.json
 - Создан образ на базе ubuntu16.json
 - На основе созданного образа создана ВМ и проверен деплой тестового приложения в неё
 - Шаблон самостоятельно параметризирован по заданным и самостоятельно выбранным опциям билдера
 - *Создан шаблон immutable.json и построен bake-образ
 - *Создан скрипт автоматизации создания ВМ create-reddit-vm.sh

### Как запустить
 - Для создания образа без деплоя приложения запустить команду packer cd packer && build -var-file=./variables.json ./ubuntu16.json
 - Для создания образа с деплоем приложения через systemd юнит запустить команду cd packer && packer build -var-file=./variables.json ./immutable.json
 - Для создания ВМ с образом с деплоем приложения запустить скрипт config-scripts/create-reddit-vm.sh
