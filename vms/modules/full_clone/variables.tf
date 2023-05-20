# ---- BASE ---- #

variable "name" {
  type        = string
  description = "VM name"
}

variable "description" {
  type        = string
  description = "VM description"
}
variable "vmid" {
  type        = string
  description = "ID of the vm"
}
variable "target_node" {
  type        = string
  description = "Proxmox target node"
  default     = "pve"
}
variable "template_name" {
  type        = string
  description = "Template to clone from"
}

# ---- hardware config ---- #
variable "cores" {
  type        = number
  description = "Number of cores"
  default     = 2
}
variable "memory" {
  type        = number
  description = "Memory in MB"
  default     = 2048
}
variable "sockets" {
  type        = number
  description = "Number of sockets"
  default     = 1
}

variable "disk_size" {
  type        = string
  description = "Disk size"
  default     = "10G"
}
variable "disk_storage" {
  type        = string
  description = "Disk storage name"
}

# ---- cloud-init ---- #
variable "ci_user" {
  type        = string
  description = "Default username"
  default     = "root"
}
variable "ci_sshkeys" {
  type        = string
  description = "SSH Keys"
}
variable "ci_ipconfig" {
  type        = string
  description = "IP config"
}