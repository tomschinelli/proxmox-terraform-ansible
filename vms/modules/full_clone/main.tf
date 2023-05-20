resource "proxmox_vm_qemu" "full_clone" {
  name        = var.name
  desc        = var.description
  target_node = var.target_node
  vmid        = var.vmid
  clone       = var.template_name

  # basic VM settings here. agent refers to guest agent
  agent    = 1
  os_type  = "cloud-init"
  cores    = var.cores
  sockets  = var.sockets
  cpu      = "host"
  memory   = var.memory
  scsihw   = "virtio-scsi-pci"
  bootdisk = "scsi0"
  qemu_os  = "other"
  disk {
    slot     = 0
    # set disk size here. leave it small for testing because expanding the disk takes time.
    size     = var.disk_size
    type     = "scsi"
    storage  = var.disk_storage
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
  ciuser    = var.ci_user
  ipconfig0 = var.ci_ipconfig
  sshkeys   = var.ci_sshkeys

}
