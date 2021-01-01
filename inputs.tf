variable "base_path" {
  type        = string
  description = "Path to write files to"
}

variable "vault_key_id" {
  type        = string
  description = "ID of the KMS used for Vault unseal."
  default     = ""
}

variable "cluster_tag" {
  type        = string
  description = "Tag associated with the cluster."
}

variable "vault_server" {
  type        = bool
  description = "Add Vault server metadata."
  default     = false
}

variable "vault_api_addr" {
  type        = string
  description = "API Address to provide to Vault"
  default     = "http://active.vault.service.consul:8200"
}

variable "nomad_server" {
  type        = bool
  description = "Add Nomad server metadata."
  default     = false
}

variable "consul_server" {
  type        = bool
  description = "Add Consul server metadata."
  default     = false
}

variable "nomad_client" {
  type        = bool
  description = "Add Nomad client metadata."
  default     = false
}

variable "consul_agent" {
  type        = bool
  description = "Add non-server Consul metadata"
  default     = false
}

variable "consul_retry_join" {
  type        = list(string)
  description = "Set of retry_join parameters"
}

variable "consul_datacenter" {
  type        = string
  description = "Datacenter for consul"
  default     = "dc1"
}

variable "consul_advertise" {
  type        = string
  description = "Address to advertise to the cluster"
  default     = "{{ GetInterfaceIP \\\"eth0\\\" }}"
}

variable "consul_acls" {
  type        = bool
  description = "Include an acl{} block"
  default     = true
}

variable "consul_acl_default_policy" {
  type        = string
  description = "Default ACL policy for consul"
  default     = "deny"
}

variable "nomad_datacenter" {
  type        = string
  description = "Datacenter for nomad"
  default     = "dc1"
}

variable "nomad_advertise" {
  type        = string
  description = "Address to advertise to the cluster"
  default     = "{{ GetInterfaceIP \\\"eth0\\\" }}"
}

variable "nomad_acls" {
  type        = bool
  description = "Include an acl{} block"
  default     = true
}
