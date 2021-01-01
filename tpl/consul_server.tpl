---
mode: 0400
dest: /run/config/consul/85-gen-secret.hcl
onrender: /usr/bin/restart consul
---
encrypt = "{{poll "awssm" "${consul_gossip_key_name}"}}"
bootstrap_expect = 3

acl {
  tokens {
    agent = "{{poll "awssm" "${consul_agent_token_name}"}}"
  }
}
