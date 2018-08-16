resource "openstack_lb_loadbalancer_v2" "loadbalancer" {
  name            = "${var.lb_name}"
  vip_subnet_id   = "${openstack_networking_subnet_v2.vip_subnet.id}"
  security_group_ids = ["${var.security_groups_list}"]
}

resource "openstack_lb_listener_v2" "listener" {
  name            = "${var.lb_listener_name}"
  loadbalancer_id = "${openstack_lb_loadbalancer_v2.loadbalancer.id}"
  protocol        = "${var.lb_protocol}"
  protocol_port   = "${var.lb_port}"
}

resource "openstack_lb_pool_v2" "pool_1" {
  name            = "${var.lb_pool_name}" 
  lb_method       = "${var.lb_method}"
  protocol        = "${var.lb_protocol}"
  listener_id     = "${openstack_lb_listener_v2.listener.id}"
}

resource "openstack_lb_member_v2" "member_1" {
  address         = "${element(var.members_ip, count.index)}"
  count           = "${var.nb_members}"
  subnet_id       = "${var.members_subnet}"
  protocol_port   = "${var.lb_port}"
  pool_id         = "${openstack_lb_pool_v2.pool_1.id}" 
}

resource "openstack_lb_monitor_v2" "monitor" {
  pool_id         = "${openstack_lb_pool_v2.pool_1.id}"
  type            = "PING"
  delay           = 30
  timeout         = 5
  max_retries     = 3
}

resource "openstack_networking_network_v2" "vip_net" {
  name            = "${var.vip_network_name}"
}

resource "openstack_networking_subnet_v2" "vip_subnet" {
  network_id      = "${openstack_networking_network_v2.vip_net.id}"
  cidr            = "${var.vip_net_cidr}"
}
