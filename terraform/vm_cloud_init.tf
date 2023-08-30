  resource "proxmox_vm_qemu" "cluster_nodes" {
  for_each = {
    controller  = "10.0.0.10"
    worker1     = "10.0.0.20"
    worker2     = "10.0.0.30"
  }
  name          = each.key
  os_type       = "ubuntu"
  target_node   = "pve"
  clone         = "ubuntu-jammy-cloud-init" # ubuntu template
  agent         = 1
  memory        = 2048
  sockets       = 1
  cores         = 2
  onboot        = true
  oncreate      = false
  bootdisk      = "scsi0" # virtio0
  boot          = "cdn" # https://pve.proxmox.com/wiki/Manual:_qm.conf#_options
  scsihw        = "virtio-scsi-pci"
  qemu_os       = "other"
  # ssh_user      = "dirceu"
  # ssh_private_key   = tls_private_key.nodes_private_keys.rsa_bits
  # sshkeys       = tls_private_key.nodes_private_keys.public_key_openssh
  ## Cloud Init Settings Start ##
  ciuser        = "dirceu"
  sshkeys       = tls_private_key.nodes_private_keys.public_key_openssh
  cipassword    = "uecrid"
  nameserver    = "4.2.2.2"
  ipconfig0     = "gw=10.0.0.1,ip=${each.value}/16"
  ## Cloud Init Settings End ##
  #   disk {
  #   type         = "scsi0"
  #   storage     = "local-lvm"
  #   size        = "15G"
  # }
    network {
    bridge = "vmbr0"
    model = "virtio"
  }
}