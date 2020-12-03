variable vpc_id {
  type        = string
  description = "Nome da VPC onde estara o recurso"
}

variable subnet_id {
  type        = string
  description = "description"
}

variable ami_owner {
  type        = string
  description = "Account ID da conta onde está a imagem"
}

variable ami_name {
  type        = string
  description = "Nome da imagem a ser utilizada"
}

variable type {
  type        = string
  description = ""
}

variable key_name {}

variable security_group_id {
  type        = list(string)
  description = "description"
}

variable disable_api_termination {
  type    = bool
  default = true
}

variable associate_public_ip_address {
  type        = bool
  default     = true
  description = "description"
}

variable monitoring {
  type        = bool
  default     = true
  description = "description"
}

variable ebs_optimized {
  type    = bool
  default = true
}

variable volume_type {
  type    = string
  default = "gp2"
}
variable volume_size {
  type    = number
}

variable delete_on_termination {
  type    = bool
  default = false
}

variable iam_instance_profile {
  type = string
  description = "(optional) describe your variable"
  default = ""
}

variable user_data_base64 {
  type = string
  description = "(optional) describe your variable"
  default = ""
}

variable "encrypted" {
  type = string
  description = "(optional) describe your variable"
  default     = true
}

######### TAGS #########
variable name_instance {
  type    = string
}

variable ambiente_instance {
  type    = string
}

variable owner {
  type    = string
}

variable active {
  type        = string
  description = "Configuracao de horas ativas"
  default     = ""
}


