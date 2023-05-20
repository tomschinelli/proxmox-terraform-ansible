resource "proxmox_vm_qemu" "srv_demo_1" {
  name        = "boilerplate-demo-1"
  desc        = "Boilerplate demo 1"
  target_node = "pve"
  vmid        = "101"
  clone       = "ubuntu-2204-cloudinit-template"

  # basic VM settings here. agent refers to guest agent
  agent    = 1
  os_type  = "cloud-init"
  cores    = 2
  sockets  = 1
  cpu      = "host"
  memory   = 2048
  scsihw   = "virtio-scsi-pci"
  bootdisk = "scsi0"

  disk {
    slot     = 0
    # set disk size here. leave it small for testing because expanding the disk takes time.
    size     = "10G"
    type     = "scsi"
    storage  = "fast1"
    iothread = 0 // 1 causes "VM 101 already running"
  }
  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  lifecycle {
    ignore_changes = [
      network,
    ]
  }
  ciuser = "tom"
  ipconfig0 = "ip=192.168.1.203/24,gw=192.168.1.1"
  sshkeys   = file("~/.ssh/id_rsa.pub")

}

