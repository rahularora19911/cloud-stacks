# Backend v5

## Topology
```
                                                              .--.               
                                                          _ -(    )- _           
                                                     .--,(            ),--.      
                                                 _.-(                       )-._ 
                                                (           INTERNET            )
                                                 '-._(                     )_.-' 
                                                      '__,(            ),__'     
                                                           - ._(__)_. -          
                                                                |
                                                                |
                                                                |
                                                                |
                                ----------------------------------------------------------------
                                |                                                              |
                                |                                                              |
                             gateway                                                           |
                           __________                                                       89.39.49.3
                          [_...__...°]                                                      bastion
                                |                               .-,(  ),-.                   ____ 
                                |                            .-(          )-.               |====|
                   -----------------------------------------(   bastion_net  )--------------|    |
                   |                           |             '-(          ).-'              |    |
                   |                           |                 '-.( ).-'                  |____|
                   |                           |
                   |                           |                                            192.168.1.3
              .-,(  ),-.                  .-,(  ),-.     
           .-(          )-.            .-(          )-.  
          (   backend_net  )          (   lb_vip_net   ) 
           '-(          ).-'           '-(          ).-' 
               '-.( ).-'                   '-.( ).-'     
                   |                           |
                   |                           |
                   |                     192.168.20.3
                   |                     load_balancer
                   |                      __________ 
                   |                     |____oooo_°|
                   |                           |
                   |                           |
                   |                           |
               ----------------------------------------
               |                |                     |
          192.168.10.3     192.168.10.4          192.168.10.xxx
          backend_0        backend_1             backend_n
           ________         ________              ________ 
          |==|=====|       |==|=====|            |==|=====|
          |  |     |       |  |     |            |  |     |
          |  |     |       |  |     |            |  |     |
          |  |     |       |  |     |   . . .    |  |     |
          |  |     |       |  |     |            |  |     |
          |  |====°|       |  |====°|            |  |====°|
          |__|_____|       |__|_____|            |__|_____|
```

## Usage
```
$ vim terraform.tfvars # Edit mandatory input variables
$ source openstack.rc
$ terraform init
$ terraform apply
```
## Input parameters
| Name                    | Default         | Description                                                                                            |
|-------------------------|-----------------|--------------------------------------------------------------------------------------------------------|
| image_name              |                 | Image of the instance                                                                                  |
| flavor_name             |                 | Flavor of the instance                                                                                 |
| key_pair                |                 | Key pair name used for SSH                                                                             |
| backend_name            | backend_server  | Name of the backend instance (Update this variable in terraform.tfvars for lbv2 e.x. backend_server_v2)| 
| backend_security_groups | ["default"]     | List of the backend security groups                                                                    |
| backend_ansible_group   | backend         | Ansible hostgroups name for backend                                                                    |
| backend_net             | backend_net     | Name of the backend network (Update this variable in terraform.tfvars for lbv2 e.x. backend_net_v2)    |
| backend_cidr            | 192.168.10.0/24 | CIDR of the backend network (Update this variable in terraform.tfvars for lbv2 e.x. 102.168.30.0/24)   |
| nb_backend              | 2               | Number of backend to create                                                                            |
| bastion_name            | bastion_server  | Name of the bastion instance (Update this variable in terraform.tfvars for lbv2 e.x. bastion_server_v2)|
| bastion_security_groups | ["default"]     | List of the bastion security groups                                                                    |
| bastion_ansible_group   | bastion         | Ansible hostgroups name for bastion                                                                    |
| bastion_net             | bastion_net     | Name of the bastion network (Update this variable in terraform.tfvars for lbv2 e.x. bastion_net_v2)    |                  
| bastion_cidr            | 192.168.1.0/24  | CIDR of the bastion network (Update this variable in terraform.tfvars for lbv2 e.x. 192.168.2.0/24)    |            
| external_net            | public          | Name of the pool to rertieve the floating IP                                                           |
| gateway_name            | gateway         | Name of the router (Update this variable in terraform.tfvars for lbv2 e.x. gateway_v2)                 |                          
| vip_net                 | lb_vip_net      | Name of the VIP network (Update this variable in terraform.tfvars for lbv2 e.x. lb_vip_net_v2)         |
| vip_cidr                | 192.168.20.0/24 | CIDR of the VIP network (Update this variable in terraform.tfvars for lbv2 e.x. 102.168.40.0/24)       |
| lb_port                 | 80              | LBaaS port number                                                                                      |
| lb_protocol             | HTTP            | LBaaS protocol                                                                                         |
| lb_method               | ROUND_ROBIN     | LBaaS method                                                                                           |       
| lb_provider             | haproxy         | LBaaS provider (implementation) (Update this variable in terraform.tfvars for lbv2 e.x. opencontrail)  |
| lb_pool_name            | lb_pool         | LBaaS pool name (Update this variable in terraform.tfvars for lbv2 e.x. backend_pool_v2)               |
| lb_vip_name             | lb_vip          | LBaaS VIP name                                                                                         |

## Output values
| Name          | Description                                  |
|---------------|----------------------------------------------|
| backend_ip    | Internal IP address of backend               |
| vip_address   | VIP address of the LBaaS                     |
| bastion_ip    | Internal IP address of bastion               |
| bastion_fip   | Floating IP address of bastion               |

## Prerequisites
None.
