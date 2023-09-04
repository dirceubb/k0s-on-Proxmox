# Automate Kubernetes cluster creation on Proxmox
## Tools used are: Terraform, Ansible, k0s

Note: if run on windows, it's best to use powershell 7, otherwise there might be compatibilty issues with the default BOM encoding on windows

1. Based on this [guide](https://pve.proxmox.com/wiki/Cloud-Init_Support) you can run following commands to get a cloud init ready to clone VM

```
wget https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img
qm create 9000 --memory 2048 --net0 virtio,bridge=vmbr0 --scsihw virtio-scsi-pci --name "ubuntu-jammy-cloud-init"
qm set 9000 --scsi0 local-lvm:0,import-from=/var/lib/vz/template/iso/jammy-server-cloudimg-amd64.img
qm set 9000 --ide2 local-lvm:cloudinit
qm set 9000 --boot order=scsi0
qm set 9000 --agent enabled=1
```

1. Export Proxmox's api TOKEN_ID and TOKEN_SECRET
windows
```
$Env:PM_API_TOKEN_ID = 'poxmox-token@my-pve-node!main'
$Env:PM_API_TOKEN_SECRET = 'my-secret'
```
linux/mac
```
export PM_API_TOKEN_ID = 'poxmox-token@my-pve-node!main'
export PM_API_TOKEN_SECRET = 'my-secret'
```

1. Plan and Apply terraform
```
terraform plan -out=tfplan
terraform apply tfplan
```

1. Copy private key to a local file
```
terraform output --raw test_pk_openssh > ~/.ssh/rsa_proxmox_nodes
```
> Alternatively if runninw from powersheel windows new lines must converted to unix
```
((Get-Content ~/.ssh/rsa_proxmox_nodes) -join "`n") + "`n" | Set-Content -NoNewline ~/.ssh/rsa_proxmox_nodes
```

1. Ansible run playbook
```
ansible-playbook -i inventory k0s-install-playbook.yaml
```