variable "base_path" {
  type        = string
  description = "Path to write files to"
}

variable "secret_provider" {
  type        = string
  description = "Emissary plugin to retrieve secrets with"
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

variable "vault_service_tags" {
  type        = string
  description = "Tags to pass to consul.servivce_tags"
  default     = ""
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

variable "consul_bootstrap_expect" {
  type        = number
  description = "Number of servers to wait for bootstrapping"
  default     = 3
}

variable "nomad_datacenter" {
  type        = string
  description = "Datacenter for nomad"
  default     = "dc1"
}

variable "nomad_bootstrap_expect" {
  type        = number
  description = "Number of servers to wait for bootstrapping"
  default     = 1
}
