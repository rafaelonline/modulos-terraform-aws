variable "generate_ssh_key" {
  type        = bool
  default     = true
  description = "If set to `true`, new SSH key pair will be created"
}

variable "ssh_key_algorithm" {
  type        = string
  default     = "RSA"
  description = "SSH key algorithm"
}

variable key_name {
  description = "Name SSH Key"
}

variable "ambiente_instance" {
  type    = string
}

variable "owner" {
  type    = string
}



variable "private_key_extension" {
  type        = string
  default     = ".pem"
  description = "Private key extension"
}

variable "public_key_extension" {
  type        = string
  default     = ".pub"
  description = "Public key extension"
}

variable "ssh_public_key_path" {
  type        = string
  description = "Path to SSH public key directory (e.g. `/secrets`)"
}