1. Based on this [guide](https://pve.proxmox.com/wiki/Cloud-Init_Support) you can run following commands to get a cloud init ready to clone VM

```
wget https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img
qm create 9000 --memory 2048 --net0 virtio,bridge=vmbr0 --scsihw virtio-scsi-pci --name "ubuntu-jammy-cloud-init"
qm set 9000 --scsi0 local-lvm:0,import-from=/var/lib/vz/template/iso/jammy-server-cloudimg-amd64.img
qm set 9000 --ide2 local-lvm:cloudinit
qm set 9000 --boot order=scsi0
qm set 9000 --agent enabled=1
```
2. Plan and apply terraform