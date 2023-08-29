# resource "proxmox_vm_qemu" "ubuntu-jammy-base-cloud-ini" {
#   name          = "ubuntu-jammy"
#   os_type       = "cloud-ini"
#   target_node   = "pve"
#   agent         = 1 
#   memory        = 2048
#   sockets       = 1
#   cores         = 2
#   onboot        = true
#   oncreate      = false
#   bootdisk      = "virtio0"
#   boot          = "cdn" # https://pve.proxmox.com/wiki/Manual:_qm.conf#_options
#   scsihw        = "virtio-scsi-pci"
#   qemu_os       = "other"
#   iso           = "local:iso/jammy-server-cloudimg-amd64.img"
#     disk {
#     type          = "virtio"
#     storage       = "local-lvm"
#     ## IMPORTANT ##
#     ## file attribute most match the image path when VM is created ##
#     ## but update it to the disk name after that ##
#     file          = "/var/lib/vz/template/iso/jammy-server-cloudimg-amd64.img"
#     # file          = "vm-100-disk-0"
#     # volume        = "local-lvm:vm-100-disk-0"
#     size          = "3G"
#     # ssd         = 1
#   }
#     network {
#     bridge = "vmbr0"
#     model = "virtio"
#   }
# }