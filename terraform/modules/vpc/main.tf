resource "yandex_vpc_network" "app-network" {
  name = "${var.environment}-reddit-app-network"
}

resource "yandex_vpc_subnet" "app-subnet" {
  name           = "${var.environment}-reddit-app-subnet"
  zone           = "ru-central1-a"
  network_id     = "${yandex_vpc_network.app-network.id}"
  v4_cidr_blocks = [var.cidr]
}
