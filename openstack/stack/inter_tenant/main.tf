provider "openstack" {
  alias       = "project_A"
  user_name   = "${var.user_project_A}"
  tenant_name = "${var.name_project_A}"
  password    = "${var.pwd_project_A}"

  #auth_url    = "http://myauthurl:5000/v2.0"
  #region      = "${var.region}"
}

provider "openstack" {
  alias       = "project_B"
  user_name   = "${var.user_project_B}"
  tenant_name = "${var.name_project_B}"
  password    = "${var.pwd_project_B}"

  #auth_url    = "http://myauthurl:5000/v2.0"
  #region      = "${var.region}"
}

module "deployment_project_A" {
  source = "../../base/backend/v2/"

  providers = {
    openstack = "openstack.project_A"
  }

  image_name            = "${var.image_name}"
  flavor_name           = "${var.flavor_name}"
  key_pair              = "${var.key_pair_project_A}"
  backend_name          = "${var.backend_name}"
  backend_ansible_group = "${var.backend_ansible_group}"
  bastion_name          = "${var.bastion_name}"
  bastion_ansible_group = "${var.bastion_ansible_group}"
  external_net          = "${var.external_net}"
  backend_net           = "${var.backend_net}"
  backend_cidr          = "${var.backend_cidr_project_A}"
  backend_security_groups = "${list(module.security_group_ssh_icmp_project_A.secgroup_name)}"
  bastion_net           = "${var.bastion_net}"
  bastion_cidr          = "${var.bastion_cidr_project_A}"
  bastion_security_groups = "${list(module.security_group_ssh_icmp_project_A.secgroup_name)}"
  gateway_name          = "${var.gateway_name}"
  nb_backend            = "${var.nb_backend}"
}

module "security_group_ssh_icmp_project_A" {
  source        = "../../base/security_group_ssh_icmp/v1"

  providers = {
    openstack = "openstack.project_A"
  }

  secgroup_name = "${var.security_group_ssh_icmp_name}"
}

module "deployment_project_B" {
  source = "../../base/backend/v2/"

  providers = {
    openstack = "openstack.project_B"
  }

  image_name            = "${var.image_name}"
  flavor_name           = "${var.flavor_name}"
  key_pair              = "${var.key_pair_project_B}"
  backend_name          = "${var.backend_name}"
  backend_ansible_group = "${var.backend_ansible_group}"
  bastion_name          = "${var.bastion_name}"
  bastion_ansible_group = "${var.bastion_ansible_group}"
  external_net          = "${var.external_net}"
  backend_net           = "${var.backend_net}"
  backend_cidr          = "${var.backend_cidr_project_B}"
  backend_security_groups = "${list(module.security_group_ssh_icmp_project_B.secgroup_name)}"
  bastion_net           = "${var.bastion_net}"
  bastion_cidr          = "${var.bastion_cidr_project_B}"
  bastion_security_groups = "${list(module.security_group_ssh_icmp_project_B.secgroup_name)}"
  gateway_name          = "${var.gateway_name}"
  nb_backend            = "${var.nb_backend}"
}

module "security_group_ssh_icmp_project_B" {
  source        = "../../base/security_group_ssh_icmp/v1"

  providers = {
    openstack = "openstack.project_B"
  }

  secgroup_name = "${var.security_group_ssh_icmp_name}"
}
