# Default
variable "image_name" {}

variable "flavor_name" {}
variable "key_pair" {}

# Backend
variable "backend_name" {
  default = "backend_server"
}

variable "backend_security_groups" {
  type    = "list"
  default = ["default"]
}

variable "backend_ansible_group" {
  default = "backend"
}

variable "nb_backend" {
  default = "2"
}

# Bastion
variable "bastion_name" {
  default = "bastion_server"
}

variable "bastion_security_groups" {
  type    = "list"
  default = ["default"]
}

variable "bastion_ansible_group" {
  default = "bastion"
}

# Network
variable "external_net" {
  default = "public"
}

variable "backend_net" {
  default = "backend_net"
}

variable "backend_cidr" {
  default = "192.168.10.0/24"
}

variable "bastion_net" {
  default = "bastion_net"
}

variable "bastion_cidr" {
  default = "192.168.1.0/24"
}

variable "vip_net" {
  default = "backend_vip_net"
}

variable "vip_cidr" {
  default = "192.168.20.0/24"
}

# Router
variable "gateway_name" {
  default = "gateway"
}

# LBaaS
variable "lb_port" {
  default = "80"
}

variable "lb_protocol" {
  default = "HTTP"
}

variable "lb_method" {
  default = "ROUND_ROBIN"
}

variable "lb_provider" {
  default = "haproxy"
}

variable "lb_pool_name" {
  default = "backend_pool"
}

variable "lb_vip_name" {
  default = "backend_vip"
}

variable "lb_security_groups" {
  type    = "list"
}
