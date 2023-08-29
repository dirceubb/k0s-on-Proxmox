output "nodes_private_key_openssh" {
  value     = tls_private_key.nodes_private_keys.public_key_openssh
  sensitive = true
}

output "test_pk_pem_pkcs8" {
  value     = tls_private_key.nodes_private_keys.private_key_pem_pkcs8
  sensitive = true
}
output "test_pk_openssh" {
  value     = tls_private_key.nodes_private_keys.private_key_openssh
  sensitive = true
}
output "test_pk_pem" {
  value     = tls_private_key.nodes_private_keys.private_key_pem
  sensitive = true
}