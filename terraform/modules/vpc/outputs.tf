output "subnet_id" {
  value = yandex_vpc_subnet.app-subnet.id
}

output "network_id" {
  value = yandex_vpc_network.app-network.id
}
