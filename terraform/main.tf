terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.70.0"
    }
  }

  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "terraform.tfstate-object-storage"
    region     = "us-east-1"
    key        = "./terraform.tfstate"
#   access_key = "<идентификатор статического ключа>"
#   secret_key = "<статический ключ>"
    skip_region_validation      = true
    skip_credentials_validation = true
  }
}

provider "yandex" {
# token     = "<OAuth токен>"
  cloud_id  = "b1gcm4k9baorpns7uab6"
  folder_id = "b1gcrqp8v8qik1s7c2ps"
  zone      = "ru-central1-a"
}

resource "yandex_compute_instance" "prod-vm" {
  name = "terraform-prod-vm"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd81a49qficqvt0dthu8"
    }
  }
  
  allow_stopping_for_update = true

  network_interface {
    subnet_id = yandex_vpc_subnet.prod-subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_vpc_network" "prod-network" {
  name = "terraform-prod-network"
}

resource "yandex_vpc_subnet" "prod-subnet" {
  name           = "terraform-prod-subnet"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.prod-network.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

output "internal_ip_address_prod_vm" {
  value = yandex_compute_instance.prod-vm.network_interface.0.ip_address
}

output "external_ip_address_prod_vm" {
  value = yandex_compute_instance.prod-vm.network_interface.0.nat_ip_address
}
