output "backend_ip" {
  value = "${module.backend.ip_address}"
}

output "vip_address" {
  value = "${module.lbaasv2.vip_address}"
}

output "bastion_ip" {
  value = "${module.bastion.ip_address}"
}

output "bastion_fip" {
  value = "${module.bastion.fip_address}"
}
