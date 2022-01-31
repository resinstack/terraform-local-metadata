---
dest: /run/config/vault/85-gen-secret.hcl
mode: 0400
onrender: /usr/bin/sv restart vault
---
storage "consul" {
  token        = "{{poll "${secret_provider}" "${vault_consul_token_name}"}}"
  service_tags = "${service_tags}"
}
