resource "local_file" "consul_server_retry_join" {
  count   = var.consul_agent || var.consul_server ? 1 : 0
  content = "retry_join = [\"${join(",", var.consul_retry_join)}\"]\n"

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

data "template_file" "consul_advertise" {
  count = var.consul_agent || var.consul_server ? 1 : 0

  template = file("${path.module}/tpl/consul_advertise.tpl")
  vars = {
    consul_advertise = var.consul_advertise
  }
}

resource "local_file" "consul_advertise" {
  count = var.consul_agent || var.consul_server ? 1 : 0

  content = data.template_file.consul_advertise[0].rendered

  filename             = "${var.base_path}/consul/90-gen-advertise.hcl"
  file_permission      = "0644"
  directory_permission = "0755"
}

data "template_file" "consul_acl" {
  count = (var.consul_agent || var.consul_server) && var.consul_acls ? 1 : 0

  template = file("${path.module}/tpl/consul_acl.tpl")
  vars = {
    acl_policy = var.consul_acl_default_policy
  }
}

resource "local_file" "consul_acl" {
  count = (var.consul_agent || var.consul_server) && var.consul_acls ? 1 : 0

  content = data.template_file.consul_acl[0].rendered

  filename             = "${var.base_path}/consul/90-gen-acl.hcl"
  file_permission      = "0644"
  directory_permission = "0755"
}

data "template_file" "emissary_consul_server" {
  count = var.consul_server ? 1 : 0

  template = file("${path.module}/tpl/consul_server.tpl")
  vars = {
    consul_gossip_key_name = "resinstack-consul-gossip-key-${var.cluster_tag}"
  }
}

resource "local_file" "emissary_consul_server" {
  count = var.consul_server ? 1 : 0

  content = data.template_file.emissary_consul_server[0].rendered

  filename             = "${var.base_path}/emissary/90-gen-consul.tpl"
  file_permission      = "0644"
  directory_permission = "0755"
}

data "template_file" "emissary_consul_agent" {
  count = var.consul_agent ? 1 : 0

  template = file("${path.module}/tpl/consul_agent.tpl")
  vars = {
    consul_gossip_key_name  = "resinstack-consul-gossip-key-${var.cluster_tag}"
    consul_agent_token_name = "resinstack-consul-agent-token-${var.cluster_tag}"
  }
}

resource "local_file" "emissary_consul_agent" {
  count = var.consul_agent ? 1 : 0

  content = data.template_file.emissary_consul_agent[0].rendered

  filename             = "${var.base_path}/emissary/90-gen-consul.tpl"
  file_permission      = "0644"
  directory_permission = "0755"
}
