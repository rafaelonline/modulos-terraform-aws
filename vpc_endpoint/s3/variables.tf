variable "enable_s3_endpoint" {
    type = bool
    description = "(optional) describe your variable"
    default = true
}

variable "vpc_id" {
    type = string
    description = "(optional) describe your variable"
}

variable "ambiente" {
    type = string
}

variable "owner" {
    type = string
    description = "(optional) describe your variable"
}

variable "enable_public_s3_endpoint" {
    type = bool
    description = "(optional) describe your variable"
    default = true
}

variable "enable_private_s3_endpoint" {
    type = bool
    description = "(optional) describe your variable"
    default = true
}

variable "route_table_public_id" {
    type = string
    description = "(optional) describe your variable"
}

variable "route_table_private_id" {
    type = string
    description = "(optional) describe your variable"
}