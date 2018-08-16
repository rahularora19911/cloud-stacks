# Members
variable members_ip {
  type = "list"
}

variable nb_members {}
variable members_subnet {}

# Network
variable vip_network_name {
  default = "lb_vip_net_tf"
}

variable vip_net_cidr {
  default = "192.168.20.0/24"
}

# LBaaS
variable lb_port {
  default = "80"
}

variable lb_protocol {
  default = "HTTP"
}

variable lb_method {
  default = "ROUND_ROBIN"
}

variable lb_provider {
  default = "haproxy"
}

variable lb_pool_name {
  default = "lb_pool_tf"
}

variable lb_vip_name {
  default = "lb_vip_tf"
}

variable lb_name {
  default = "lb_v2"
}

variable lb_listener_name {
  default = "lb_listener"
}

variable "security_groups_list" {
  type    = "list"
}

