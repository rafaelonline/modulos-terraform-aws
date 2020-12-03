variable region {
  type        = string
  default     = "us-east-1"
  description = "Regiao onde estara o recurso"
}

variable profile {
  type        = string
  default     = "walsh-prod"
  description = "Conta/ambiente que sera utilizada para criar os recursos"
}

variable vpc_name {
  type        = string
  default     = "VPC"
  description = "Nome da VPC onde estara o recurso"
}

variable subnet_private0 {
  type        = string
  default     = "Subnet-private0"
  description = "description"
}

variable subnet_private1 {
  type        = string
  default     = "Subnet-private1"
  description = "description"
}

variable instance_identifier {
  type        = string
  default     = "homologacao"
  description = "description"
}

variable "db_instance" {
  default = "db.t3.micro"
}
variable "db_name" {
  default = "homologacao"
}

variable "key_name" {
  default = "horen-walsh"
}

variable "ambiente" {
  default = "walsh"
}

variable "volume_type" {
  default = "gp2"
}
variable "volume_size" {
  default = 20
}
variable volume_encrypted {
  type        = string
  default     = "true"
  description = "description"
}

variable engine {
  type        = string
  default     = "mysql"
  description = "description"
}
variable engine_version {
  type        = string
  default     = "5.7.28"
  description = "description"
}
variable master_username {
  type        = string
  default     = "admin"
  description = "description"
}
variable password {
  type        = string
  default     = "Ecology2210"
  description = "description"
}
variable parameter_group_name {
  type        = string
  default     = "default.mysql5.7"
  description = "description"
}
variable major_version {
  type        = string
  default     = "false"
  description = "description"
}
variable minor_version {
  type        = string
  default     = "true"
  description = "description"
}
variable backup_retention {
  type        = string
  default     = "7"
  description = "description"
}
variable backup_window {
  type        = string
  default     = "23:00-00:00"
  description = "description"
}
variable maintenance_window {
  type        = string
  default     = "Sat:01:00-Sat:04:00"
  description = "description"
}
variable multi_az {
  type        = string
  default     = "false"
  description = "description"
}
variable skip_final_snapshot {
  type        = string
  default     = "true"
  description = "description"
}
variable port {
  type        = string
  default     = "3306"
  description = "description"
}
variable monitoring_interval {
  type        = string
  default     = "60"
  description = "description"
}
variable kms_key {
  type        = string
  default     = "arn:aws:kms:us-east-1:536620048806:key/2274299d-6acb-4834-83e8-feb346fe6f7a"
  description = "description"
}
variable subnet_group {
  type        = string
  default     = "db_sub_homolog_backend"
  description = "description"
}
variable az {
  type        = string
  default     = "us-east-1a"
  description = "description"
}
variable public {
  type        = string
  default     = "false"
  description = "description"
}
variable copy_tags {
  type        = string
  default     = "true"
  description = "description"
}
variable deletion {
  type        = string
  default     = "true"
  description = "description"
}
variable security_group {
  type        = string
  default     = "sg-0ef5bf81584048980"
  description = "description"
}

