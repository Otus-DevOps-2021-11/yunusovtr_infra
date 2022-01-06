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
