output "vip_port_id" {
  value = "${openstack_lb_loadbalancer_v2.loadbalancer.vip_port_id}"
}

output "vip_subnet_id" {
  value = "${openstack_networking_subnet_v2.vip_subnet.id}"
}

output "vip_address" {
  value = "${openstack_lb_loadbalancer_v2.loadbalancer.vip_address}"
}

output "backend_address" {
  value = ["${openstack_lb_member_v2.member_1.*.address}"]
}
