data "template_file" "puma_unit" {
  template = "${file("${path.module}/files/puma.service")}"
  vars = {
    database_url = "${var.database_url}"
  }
}

resource "yandex_compute_instance" "app" {
  count = var.instance_count

  name = "${var.environment}-reddit-app${count.index}"
  zone = var.vm_zone

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      # Указать id образа созданного в предыдущем домашем задании
      image_id = var.app_disk_image
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }
}

resource "null_resource" "conditional_provisioner" {
  for_each = var.provision ? { for app in yandex_compute_instance.app.* : app.name => app } : {}

  connection {
    type  = "ssh"
    host  = each.value.network_interface.0.nat_ip_address
    user  = "ubuntu"
    agent = false
    # путь до приватного ключа
    private_key = file(var.private_key_path)
  }

  provisioner "file" {
    content     = data.template_file.puma_unit.rendered
    destination = "/tmp/puma.service"
  }

  provisioner "remote-exec" {
    script = "${path.module}/files/deploy.sh"
  }
}
