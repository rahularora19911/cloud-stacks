# LBaaS v2

## Topology
```
     .-,(  ),-.                               __________    LB METHOD          .-,(  ),-.
  .-(          )-.  LB PROTOCOL/PORT  .-----.[_|||||||_°]---------------->  .-(          )-.
 (     VIP net    ) ----------------> | VIP |[_|||||||_°]----------------> (   members net  )
  '-(          ).-'                   '-----'[_|||||||_°]---------------->  '-(          ).-'
      '-.( ).-'                                                                 '-.( ).-'
```

## Usage
```
$ vim terraform.tfvars # Edit mandatory input variables
$ source openstack.rc
$ terraform init
$ terraform apply
```
## Input parameters
| Name             | Default         | Description                                                                                              |
|------------------|-----------------|----------------------------------------------------------------------------------------------------------|
| members_ip       |                 | List of the members IP addresses                                                                         |
| nb_members       |                 | Total number of members                                                                                  |
| members_subnet   |                 | Subnet ID of the members                                                                                 |
| vip_network_name | lb_vip_net_tf   | Name of the VIP network (Update this variable in terraform.tfvars for lbv2 e.x. lb_vip_net_tf_v2 )       |
| vip_net_cidr     | 192.168.20.0/24 | CIDR of the VIP network (Update this variable in terraform.tfvars for lbv2 e.x. 192.168.40.0/24 )        |
| lb_port          | 80              | Port managed by the loadbalancer                                                                         |
| lb_protocol      | HTTP            | Protocol managed by the loadbalancer                                                                     |
| lb_method        | ROUND_ROBIN     | Load balancing method                                                                                    |
| lb_provider      | haproxy         | Implementation of the loadbalancer (Update this variable in terraform.tfvars for lbv2 e.x. opencontrail )|
| lb_pool_name     | lb_pool_tf      | Name of the pool (Update this variable in terraform.tfvars for lbv2 e.x. lb_pool_tf_v2 )                 |                            
| lb_vip_name      | lb_vip_tf       | Name of the vip                                                                                          |
| lb_name          | lb_v2           | Name of the loadbalancer                                                                                 |
| lb_listener_name | lb_listener     | Name of the listener                                                                                     |

## Output values
| Name            | Description                                  |
|-----------------|----------------------------------------------|
| vip_port_id     | Port ID of the Virtual IP                    |
| vip_subnet_id   | Subnet ID of the Virtual IP                  |
| vip_address     | IP address of the Virtual IP                 |
| backend_address | List of IP addresses of the members          |

## Prerequisites
None.
