# yunusovtr_infra
yunusovtr Infra repository

## Подключение одной строкой
ssh -J appuser@62.84.115.5 appuser@10.128.0.28

## Вариант решения для подключения из консоли по команде `ssh someinternalhost`
Внести в ~/.ssh/config строки:

Host bastion
  HostName 62.84.115.5
  User appuser
Host someinternalhost
  HostName 10.128.0.28
  User appuser
  ProxyJump bastion

Затем можно подключаться командой
ssh someinternalhost
