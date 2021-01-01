---
dest: /run/config/nomad/85-gen-secret.hcl
mode: 0400
onrender: /usr/bin/restart nomad
---

server {
  enabled = true
  encrypt = "{{poll "awssm" "${nomad_gossip_key_name}"}}"
  bootstrap_expect = 3
}

consul {
  token = "{{poll "awssm" "${nomad_consul_token_name}"}}"
}

vault {
    enabled = true
    address = "http://active.vault.service.consul:8200"
    create_from_role = "nomad-cluster"
    token = "{{poll "awssm" "${nomad_vault_token_name}"}}"
}
