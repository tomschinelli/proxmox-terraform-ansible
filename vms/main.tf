# module "demo-debian-11" {
#   source        = "./modules/full_clone"
#   name          = "demo-debian-11"
#   description   = "Demo vm created via terraform"
#   vmid          = "101"
#   template_name = "debian-11"
#   target_node   = "nuc01"
#
#   disk_size    = "10G"
#   disk_storage = "local-lvm"
#   ci_ipconfig  = "ip=192.168.8.222/24,gw=192.168.8.1"
#   ci_user      = "tom"
#   ci_sshkeys   = file("~/.ssh/id_rsa.pub")
# }

resource "proxmox_virtual_environment_download_file" "debian_12" {
  content_type        = "iso"
  datastore_id        = "local"
  file_name           = "debian-12-generic-amd64.img"
  node_name           = "nuc01"
  url                 = "https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-genericcloud-amd64.qcow2"
  overwrite           = true
  overwrite_unmanaged = true
}

data "local_file" "ssh_public_key" {
  filename = pathexpand("~/.ssh/id_rsa.pub")
}

resource "proxmox_virtual_environment_vm" "demo" {
#   name      = "demo_debian_12"
  description = "Managed by Terraform"
  tags        = ["terraform", "ubuntu"]

  node_name = "nuc01"
  vm_id     = "102"

#   keyboard_layout = ""
  initialization {
    user_account {
      username = "tom"
      keys = [trimspace(data.local_file.ssh_public_key.content)]
    }

    ip_config {
      ipv4 {
        address = "192.168.8.222/24"
        gateway = "192.168.8.1"
      }
    }
  }
  disk {
    datastore_id = "local-lvm"
    file_id      = proxmox_virtual_environment_download_file.debian_12.id
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = 40
  }
  cpu {
    cores = 4
  }
  memory {
    dedicated = 4096
  }
  network_device {
    bridge = "vmbr0"
  }
}