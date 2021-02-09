resource "local_file" "vault_kms_id" {
  count = var.vault_key_id != "" ? 1 : 0

  content = "seal \"awskms\" {\n  kms_key_id = \"${var.vault_key_id}\"\n}\n"

  filename             = "${var.base_path}/vault/90-gen-seal.hcl"
  file_permission      = "0644"
  directory_permission = "0755"
}

data "template_file" "emissary_vault" {
  count = var.vault_server ? 1 : 0

  template = file("${path.module}/tpl/vault.tpl")
  vars = {
    secret_provider = var.secret_provider
    service_tags = var.vault_service_tags
    vault_consul_token_name = "resinstack-vault-consul-token-${var.cluster_tag}"
  }
}

resource "local_file" "emissary_vault" {
  count = var.vault_server ? 1 : 0

  content = data.template_file.emissary_vault[0].rendered

  filename             = "${var.base_path}/emissary/90-gen-vault.tpl"
  file_permission      = "0644"
  directory_permission = "0755"
}
