module "backend" {
  source               = "../../vm_on_one_network"
  instance_name        = "${var.backend_name}"
  image_name           = "${var.image_name}"
  flavor_name          = "${var.flavor_name}"
  key_pair             = "${var.key_pair}"
  security_groups_list = "${var.backend_security_groups}"
  ansible_group        = "${var.backend_ansible_group}"
  network_name         = "${var.backend_net}"
  cidr                 = "${var.backend_cidr}"
  count                = "${var.nb_backend}"
}

module "bastion" {
  source               = "../../vm_with_floatingip"
  instance_name        = "${var.bastion_name}"
  image_name           = "${var.image_name}"
  flavor_name          = "${var.flavor_name}"
  key_pair             = "${var.key_pair}"
  security_groups_list = "${var.bastion_security_groups}"
  ansible_group        = "${var.bastion_ansible_group}"
  network_name         = "${var.bastion_net}"
  cidr                 = "${var.bastion_cidr}"
  pool                 = "${var.external_net}"
  count                = 1
}

module "lbaasv2" {
  source               = "../../lbaasv2"
  members_ip           = "${module.backend.ip_address}"
  nb_members           = "${var.nb_backend}"
  members_subnet       = "${module.backend.subnet_id}"
  vip_network_name     = "${var.vip_net}"
  vip_net_cidr         = "${var.vip_cidr}"
  lb_port              = "${var.lb_port}"
  lb_protocol          = "${var.lb_protocol}"
  lb_method            = "${var.lb_method}"
  lb_provider          = "${var.lb_provider}"
  lb_pool_name         = "${var.lb_pool_name}"
  lb_vip_name          = "${var.lb_vip_name}"
  security_groups_list = "${var.lb_security_groups}"
}

module "gateway" {
  source      = "../../gateway"
  router_name = "${var.gateway_name}"
  subnet_ids  = "${list(module.backend.subnet_id, module.bastion.subnet_id, module.lbaasv2.vip_subnet_id)}"
  nb_subnet   = "3"
  external_net  = "${var.external_net}"
}
