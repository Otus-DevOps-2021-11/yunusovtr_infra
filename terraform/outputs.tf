output "external_ip_address_app" {
  value = yandex_compute_instance.app.network_interface.0.nat_ip_address
}

output "external_ip_load_balancer" {
  value = yandex_lb_network_load_balancer.reddit-app-network-lb.listener.*.external_address_spec[0].*.address[0]
}
