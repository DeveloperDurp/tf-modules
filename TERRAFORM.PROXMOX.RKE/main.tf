resource "proxmox_vm_qemu" "master" {
  count       = var.master.count
  ciuser      = "administrator"
  vmid        = "${var.vlan}${var.master.ip[count.index]}"
  name        = "rke-m-${var.appname}${format("%02d", count.index + 1)}"
  target_node = var.master.node[count.index]
  clone       = var.master.template
  qemu_os     = "other"
  full_clone  = true
  agent       = 1
  cores       = var.master.cores
  sockets     = 1
  cpu         = "host"
  memory      = var.master.memory
  scsihw      = "virtio-scsi-pci"
  bootdisk    = "scsi0"
  boot        = "c"
  onboot      = false
  network {
    model    = "virtio"
    bridge   = var.bridge
    tag      = var.vlan
    firewall = false
  }
  lifecycle {
    ignore_changes = [
      network,
    ]
  }
  #Cloud Init Settings
  ipconfig0    = "ip=192.168.20.${var.master.ip[count.index]}/24,gw=192.168.20.1"
  searchdomain = var.searchdomain
  nameserver   = var.dnsserver
  sshkeys      = var.sshkeys
}
