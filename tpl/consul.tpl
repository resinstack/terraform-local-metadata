---
mode: 0400
dest: /run/config/consul/85-gen-secret.hcl
onrender: /usr/bin/restart consul
---
encrypt = "{{poll "${secret_provider}" "${consul_gossip_key_name}"}}"

acl {
  tokens {
    agent = "{{poll "${secret_provider}" "${consul_agent_token_name}"}}"
  }
}
