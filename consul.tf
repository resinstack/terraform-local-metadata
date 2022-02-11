resource "local_file" "consul_server_retry_join" {
  count   = var.consul_agent || var.consul_server ? 1 : 0
  content = "retry_join = ${jsonencode(var.consul_retry_join)}\n"

  filename             = "${var.base_path}/consul/90-gen-retry-join.hcl"
  file_permission      = "0644"
  directory_permission = "0755"
}

resource "local_file" "consul_datacenter" {
  count   = var.consul_agent || var.consul_server ? 1 : 0
  content = "datacenter = \"${var.consul_datacenter}\"\n"

  filename             = "${var.base_path}/consul/90-gen-dc.hcl"
  file_permission      = "0644"
  directory_permission = "0755"
}

resource "local_file" "consul_bootstrap" {
  count   = var.consul_server ? 1 : 0
  content = "bootstrap_expect = ${var.consul_bootstrap_expect}\n"

  filename             = "${var.base_path}/consul/90-gen-bootstrap.hcl"
  file_permission      = "0644"
  directory_permission = "0755"
}

resource "local_file" "emissary_consul" {
  count = var.consul_agent || var.consul_server ? 1 : 0

  content = templatefile("${path.module}/tpl/consul.tpl", {
    secret_provider         = var.secret_provider
    consul_gossip_key_name  = "resinstack-consul-gossip-key-${var.cluster_tag}"
    consul_agent_token_name = "resinstack-consul-agent-token-${var.cluster_tag}"
  })

  filename             = "${var.base_path}/emissary/90-gen-consul.tpl"
  file_permission      = "0644"
  directory_permission = "0755"
}
