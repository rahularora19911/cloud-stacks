output "backend_ip_project_A" {
  value = "${module.deployment_project_A.backend_ip}"
}

output "bastion_ip_project_A" {
  value = "${module.deployment_project_A.bastion_ip}"
}

output "bastion_fip_project_A" {
  value = "${module.deployment_project_A.bastion_fip}"
}

output "backend_ip_project_B" {
  value = "${module.deployment_project_B.backend_ip}"
}

output "bastion_ip_project_B" {
  value = "${module.deployment_project_B.bastion_ip}"
}

output "bastion_fip_project_B" {
  value = "${module.deployment_project_B.bastion_fip}"
}
