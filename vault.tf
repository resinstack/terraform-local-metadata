resource "local_file" "vault_kms_id" {
  count = var.vault_key_id != "" ? 1 : 0

  content = "seal \"awskms\" {\n  kms_key_id = \"${var.vault_key_id}\"\n}\n"

  filename             = "${var.base_path}/vault/90-gen-seal.hcl"
  file_permission      = "0644"
  directory_permission = "0755"
}
