# yunusovtr_infra
yunusovtr Infra repository

## Подключение одной строкой
ssh -J appuser@51.250.6.233 appuser@10.128.0.28

## Вариант решения для подключения из консоли по команде `ssh someinternalhost`
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

## Дополнительное задание Lets Encrypt
https://51.250.6.233.sslip.io/

## Pritunl VPN
Для bastion использован образ Ubuntu 20.03 т.к. методичка устарела
bastion_IP = 51.250.6.233
someinternalhost_IP = 10.128.0.28
