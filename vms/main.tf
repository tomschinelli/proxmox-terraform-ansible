module "demo" {
  source        = "./modules/full_clone"
  name          = "demo"
  description   = "Demo vm created via terraform"
  vmid          = "101"
  template_name = "ubuntu-server-2204"

  disk_size    = "10G"
  disk_storage = "fast1"
  ci_ipconfig  = "ip=192.168.1.203/24,gw=192.168.1.1"
  ci_user      = "tom"
  ci_sshkeys   = file("~/.ssh/id_rsa.pub")
}
module "demo-2304" {
  source        = "./modules/full_clone"
  name          = "demo-2304"
  description   = "Demo vm created via terraform"
  vmid          = "102"
  template_name = "ubuntu-server-2304"

  disk_size    = "10G"
  disk_storage = "fast1"
  ci_ipconfig  = "ip=192.168.1.204/24,gw=192.168.1.1"
  ci_user      = "tom"
  ci_sshkeys   = file("~/.ssh/id_rsa.pub")
}

module "demo-debian-11" {
  source        = "./modules/full_clone"
  name          = "demo-debian-11"
  description   = "Demo vm created via terraform"
  vmid          = "103"
  template_name = "debian-11"

  disk_size    = "10G"
  disk_storage = "fast1"
  ci_ipconfig  = "ip=192.168.1.205/24,gw=192.168.1.1"
  ci_user      = "tom"
  ci_sshkeys   = file("~/.ssh/id_rsa.pub")
}
