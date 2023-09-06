#!/bin/bash

# ssh-keygen -t ed25519 -f ~/.ssh/id_rsa -q -N ""
mkdir ~/.ssh
cp /run/secrets/proxmox_id_rsa ~/.ssh/id_rsa
chmod 500 ~/.ssh/id_rsa
# ssh dirceu@10.0.0.10 -i ~/.ssh/id_rsa

ansible-playbook -i inventory k0s-install-playbook.yaml
# get kubeconfig

sudo k0s config create
# for windows the kubeconfig env is set like this
$Env:KUBECONFIG="path\my_k0s_kubeconfig"