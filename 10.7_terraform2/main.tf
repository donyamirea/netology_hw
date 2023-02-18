terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}
provider "yandex" {
        token ="XXX"
#        cloud_id = "XXX"
        folder_id = "XXX"
        zone = "ru-central1-a"
}
data "template_file" "user_data" {
        template = file("meta.txt")
        vars = {
                indexfile = file("index.html")
                nginxfile = filebase64("nginx_conf/etc/nginx/sites-enabled/default")
        }
}
resource "yandex_compute_instance" "vms" {
        count = 2
        name = "my-vm${count.index}"
        resources {
                cores = 2
                memory = 2
                core_fraction = 20
        }
        boot_disk {
                initialize_params {
                        image_id = "fd82vol772l2nq9p12pb"
                }
        }


        network_interface {
                subnet_id = yandex_vpc_subnet.subnet-1.id
        nat = true
        }

        metadata = {
        user-data = data.template_file.user_data.rendered
        }
}

resource "yandex_lb_target_group" "foo" {
        name = "bdi-target-group"
        dynamic "target" {
                for_each = yandex_compute_instance.vms.*.network_interface.0.ip_address
                content {
                        subnet_id = "${yandex_vpc_subnet.subnet-1.id}"
                        address = target.value
                }
        }
}

resource "yandex_lb_network_load_balancer" "foo" {
        name = "bdi-network-load-balancer"

        listener {
                name = "my-listener"
                port = 80
                external_address_spec {
                        ip_version = "ipv4"
                }

        }
        attached_target_group {
                target_group_id = "${yandex_lb_target_group.foo.id}"
                healthcheck {
                        name = "http"
                        http_options {
                                port = 80
                                path = "/ping"
                        }
                }
        }
}

resource "yandex_vpc_network" "network-1" {
        name = "network1"
}

resource "yandex_vpc_subnet" "subnet-1" {
        name = "subnet1"
        zone = "ru-central1-a"
        network_id = yandex_vpc_network.network-1.id
        v4_cidr_blocks = ["192.168.100.0/24"]
}

output "external_ip_address_vm" {
        value = yandex_compute_instance.vms[*].network_interface.0.nat_ip_address
}

output "internal_ip_adress_vm" {
        value = yandex_compute_instance.vms[*].network_interface.0.ip_address
}
