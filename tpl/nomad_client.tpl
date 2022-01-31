---
dest: /run/config/nomad/85-gen-secret.hcl
mode: 0400
onrender: /usr/bin/sv restart nomad
---
consul {
  token = "{{poll "${secret_provider}" "${nomad_client_consul_token_name}"}}"
}
