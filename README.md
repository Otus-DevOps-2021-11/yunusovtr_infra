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

## Домашняя работа №8: Практика IaC с использованием Terraform

### Что сделано
 - Создана конфигурация файлов для создания ВМ с базовым образом из предыдущего задания и деплоем приложения через Terraform в соответствии с методичкой
 - Определены input переменные: private_key_path, vm_zone
 - Отформатированы все файлы через terraform fmt
 - Создан файл terraform.tfvars.example
 - *Создан файл lb.tf с описанием сетевого балансировщика. В задании был указан HTTP балансировщик, но оказалось, что указанные для выполнения версии Terraform и Yandex провайдера не поддерживают L7-балансировщики из коробки, поэтому для упрощения в рамках задания был использован сетевой балансировщик от Yandex-облака.
 - *Добавлен reddit-app2. Проблема, что вижу: не реализован принцип DRY. Много проблем по поддержанию кода и проблемы масштабирования.
 - *Удалён reddit-app2. Реализовано множественное добавление ВМ через мета-атрибут count. Также для реализации был использован блок dynamic для добавления созданных ВМ в target_group.
