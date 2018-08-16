module "backend_v5" {
  source                  = "../../../base/backend/v5"
  image_name              = "${var.image_name}"
  flavor_name             = "${var.flavor_name}"
  key_pair                = "${var.key_pair}"
  nb_backend              = "${var.nb_backend}"
  backend_name            = "${var.backend_name}"
  backend_security_groups = "${list(module.security_group_ssh_icmp.secgroup_name, module.security_group_http.secgroup_name)}"
  backend_ansible_group   = "${var.backend_ansible_group}"
  bastion_name            = "${var.bastion_name}"
  bastion_security_groups = "${list(module.security_group_ssh_icmp.secgroup_name, module.security_group_http.secgroup_name)}"
  bastion_ansible_group   = "${var.bastion_ansible_group}"
  external_net            = "${var.external_net}"
  backend_net             = "${var.backend_net}"
  backend_cidr            = "${var.backend_cidr}"
  bastion_net             = "${var.bastion_net}"
  bastion_cidr            = "${var.bastion_cidr}"
  gateway_name            = "${var.gateway_name}"
  vip_net                 = "${var.vip_net}"
  vip_cidr                = "${var.vip_cidr}"
  lb_port                 = "${var.lb_port}"
  lb_protocol             = "${var.lb_protocol}"
  lb_method               = "${var.lb_method}"
  lb_pool_name            = "${var.lb_pool_name}"
  lb_vip_name             = "${var.lb_vip_name}"
  lb_provider             = "${var.lb_provider}"
  lb_security_groups      = "${list(module.security_group_ssh_icmp.secgroup_id, module.security_group_http.secgroup_id)}"
}

module "security_group_ssh_icmp" {
  source        = "../../../base/security_group_ssh_icmp/v1"
  secgroup_name = "${var.security_group_ssh_icmp_name}"
}

module "security_group_http" {
  source        = "../../../base/security_group_http/v1"
  secgroup_name = "${var.security_group_http_name}"
}
