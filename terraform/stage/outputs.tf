output "external_ip_address_app" {
  value = module.app.external_ip_address_app
}

output "external_ip_address_db" {
  value = module.db.external_ip_address_db
}

output "internal_ip_address_db" {
  value = module.db.internal_ip_address_db
}

# Генерируем инвентори соответствующего-окружения
resource "local_file" "ansible_inventory" {
  content = templatefile("inventory.tftpl",
    {
      external_ip_address_app = module.app.external_ip_address_app[0],
      external_ip_address_db = module.db.external_ip_address_db,
      internal_ip_address_db = module.db.internal_ip_address_db,
    }
  )
  filename = "../../ansible/environments/${var.environment}/inventory"
}

# output "external_ip_load_balancer" {
#   value = yandex_lb_network_load_balancer.reddit-app-network-lb.listener.*.external_address_spec[0].*.address[0]
# }
