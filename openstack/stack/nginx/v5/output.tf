output "backend_ip" {
  value = "${module.backend_v5.backend_ip}"
}

output "vip_address" {
  value = "${module.backend_v5.vip_address}"
}

output "bastion_ip" {
  value = "${module.backend_v5.bastion_ip}"
}

output "bastion_fip" {
  value = "${module.backend_v5.bastion_fip}"
}
