# Provider
variable "name_project_A" {}
variable "user_project_A" {}
variable "pwd_project_A" {}

variable "name_project_B" {}
variable "user_project_B" {}
variable "pwd_project_B" {}

# Default
variable "image_name" {}

variable "flavor_name" {}

# Keypair
variable "key_pair_project_A" {}

variable "key_pair_project_B" {}

# CIDR
variable backend_cidr_project_A {
  default = "192.168.20.0/24"
}

variable bastion_cidr_project_A {
  default = "192.168.2.0/24"
}

variable backend_cidr_project_B {
  default = "192.168.30.0/24"
}

variable bastion_cidr_project_B {
  default = "192.168.3.0/24"
}

# Backend
variable backend_name {
  default = "backend_server"
}

variable backend_ansible_group {
  default = "backend"
}

# Bastion
variable bastion_name {
  default = "bastion_server"
}

variable bastion_ansible_group {
  default = "bastion"
}

# Security Group
variable "security_group_ssh_icmp_name" {
  default = "security_group_ssh_icmp"
}

# Network
variable external_net {
  default = "public"
}

variable backend_net {
  default = "backend_net"
}

variable bastion_net {
  default = "bastion_net"
}

# Router
variable gateway_name {
  default = "gateway"
}

# Count (number of backend)
variable nb_backend {
  default = "1"
}
