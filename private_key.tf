resource "tls_private_key" "nodes_private_keys" {
  algorithm = "RSA"
  rsa_bits  = 4096
  # algorithm = "ED25519"

}