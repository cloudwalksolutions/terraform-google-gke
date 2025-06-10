# Terraform Module: Private Anthos or GKE Cluster

This is a Terraform module repository for creating an Anthos or plain GKE cluster. An Anthos cluster is a GKE cluster that is also registered with the Anthos Hub and uses Anthos Config Management to deploy kubernetes resources in a GitOps fashion. There are several other features available in Anthos but they are not yet included in this module.

<img alt="Terraform" src="https://www.terraform.io/assets/images/logo-text-8c3ba8a6.svg" width="600px">

Documentation is available on the [Terraform website](http://www.terraform.io):

- [Intro](https://www.terraform.io/intro/index.html)
- [Docs](https://www.terraform.io/docs/index.html)

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 3.89.0 |
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | 3.89.0 |
| <a name="provider_null"></a> [null](#provider\_null) | 3.1.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_failover_gke"></a> [failover\_gke](#module\_failover\_gke) | terraform-google-modules/kubernetes-engine/google//modules/beta-private-cluster-update-variant | n/a |
| <a name="module_gke"></a> [gke](#module\_gke) | terraform-google-modules/kubernetes-engine/google//modules/beta-private-cluster-update-variant | n/a |

## Resources

| Name | Type |
|------|------|
| [google-beta_google_gke_hub_feature.feature](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_gke_hub_feature) | resource |
| [google-beta_google_gke_hub_feature_membership.feature_member](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_gke_hub_feature_membership) | resource |
| [google-beta_google_gke_hub_feature_membership.feature_member_failover](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_gke_hub_feature_membership) | resource |
| [google-beta_google_gke_hub_membership.membership](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_gke_hub_membership) | resource |
| [google-beta_google_gke_hub_membership.membership_failover](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_gke_hub_membership) | resource |
| [google_compute_security_policy.policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_security_policy) | resource |
| [google_compute_ssl_policy.ssl_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_ssl_policy) | resource |
| [null_resource.wait_for_failover_gke](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.wait_for_gke](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acm_manifests_dir"></a> [acm\_manifests\_dir](#input\_acm\_manifests\_dir) | ACM manifests directory | `string` | `"/manifests"` | no |
| <a name="input_acm_repo_name"></a> [acm\_repo\_name](#input\_acm\_repo\_name) | ACM Wet Repo Name | `string` | `""` | no |
| <a name="input_acm_secret_type"></a> [acm\_secret\_type](#input\_acm\_secret\_type) | Secret type to allow ACM to connect to Git, (https/ssh) | `string` | `"ssh"` | no |
| <a name="input_acm_source_format"></a> [acm\_source\_format](#input\_acm\_source\_format) | Anthos Config Management source format | `string` | `"hierarchical"` | no |
| <a name="input_acm_version"></a> [acm\_version](#input\_acm\_version) | Anthos Config Management version | `string` | `"1.9.0"` | no |
| <a name="input_cloudrun"></a> [cloudrun](#input\_cloudrun) | Whether or not Cloudrun should be enabled | `bool` | `false` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Primary cluster name | `string` | `"central-cluster"` | no |
| <a name="input_config_connector"></a> [config\_connector](#input\_config\_connector) | Whether or not config connector should be enabled | `bool` | `false` | no |
| <a name="input_datapath_provider"></a> [datapath\_provider](#input\_datapath\_provider) | Set to ADVANCED\_DATAPATH to enable Dataplane v2 | `string` | `"ADVANCED_DATAPATH"` | no |
| <a name="input_disk_type"></a> [disk\_type](#input\_disk\_type) | Node pool disk type | `string` | `"pd-standard"` | no |
| <a name="input_dns_cache"></a> [dns\_cache](#input\_dns\_cache) | Whether or not DNS Cache should be enabled | `bool` | `false` | no |
| <a name="input_dry_repo_name"></a> [dry\_repo\_name](#input\_dry\_repo\_name) | ACM Wet Repo Name | `string` | `""` | no |
| <a name="input_enable_gatekeeper"></a> [enable\_gatekeeper](#input\_enable\_gatekeeper) | Whether Gatekeeper should be enabled for ACM | `bool` | `true` | no |
| <a name="input_failover_cluster_name"></a> [failover\_cluster\_name](#input\_failover\_cluster\_name) | Failover cluster name | `string` | `"east-cluster"` | no |
| <a name="input_failover_master_range"></a> [failover\_master\_range](#input\_failover\_master\_range) | CIDR block to be used for the GKE failover master | `string` | `""` | no |
| <a name="input_failover_pods_range_name"></a> [failover\_pods\_range\_name](#input\_failover\_pods\_range\_name) | Failover pods secondary name | `string` | `""` | no |
| <a name="input_failover_region"></a> [failover\_region](#input\_failover\_region) | GCP Failover Region | `string` | `"us-east4"` | no |
| <a name="input_failover_services_range_name"></a> [failover\_services\_range\_name](#input\_failover\_services\_range\_name) | Failover services secondary name | `string` | `""` | no |
| <a name="input_failover_subnet_name"></a> [failover\_subnet\_name](#input\_failover\_subnet\_name) | GKE subnet for failover | `string` | `""` | no |
| <a name="input_failover_zone"></a> [failover\_zone](#input\_failover\_zone) | GCP Failover Zone | `string` | `"us-east4-b"` | no |
| <a name="input_failover_zones"></a> [failover\_zones](#input\_failover\_zones) | GCP Failover Zone | `list(string)` | <pre>[<br>  "us-east4-b",<br>  "us-east4-c"<br>]</pre> | no |
| <a name="input_github_owner"></a> [github\_owner](#input\_github\_owner) | Github owner | `string` | `"hudl"` | no |
| <a name="input_gke_node_sa"></a> [gke\_node\_sa](#input\_gke\_node\_sa) | GKE Node SA | `string` | n/a | yes |
| <a name="input_gke_project_id"></a> [gke\_project\_id](#input\_gke\_project\_id) | GKE project ID | `string` | n/a | yes |
| <a name="input_image_type"></a> [image\_type](#input\_image\_type) | Image type for node pools | `string` | `"COS"` | no |
| <a name="input_istio"></a> [istio](#input\_istio) | Whether or not Istio should be enabled | `bool` | `false` | no |
| <a name="input_kalm_config"></a> [kalm\_config](#input\_kalm\_config) | Whether or not k8s application lifecycle manager should be enabled | `bool` | `false` | no |
| <a name="input_lifecycle_name"></a> [lifecycle\_name](#input\_lifecycle\_name) | GCP Lifecycle name | `string` | n/a | yes |
| <a name="input_machine_type"></a> [machine\_type](#input\_machine\_type) | Image type for node pools | `string` | `"e2-medium"` | no |
| <a name="input_master_authorized_networks"></a> [master\_authorized\_networks](#input\_master\_authorized\_networks) | Authorized network for both primary and failover cluster | `list(object({ cidr_block = string, display_name = string }))` | `[]` | no |
| <a name="input_master_range"></a> [master\_range](#input\_master\_range) | CIDR block to be used for the GKE master | `string` | n/a | yes |
| <a name="input_max_preemptible"></a> [max\_preemptible](#input\_max\_preemptible) | Max number of nodes in preemptible node pool | `number` | `6` | no |
| <a name="input_max_regular"></a> [max\_regular](#input\_max\_regular) | Max number of nodes in regular node pool | `number` | `3` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | Network name | `string` | n/a | yes |
| <a name="input_network_policy"></a> [network\_policy](#input\_network\_policy) | Whether or not to use Kubernetes Network Policy | `bool` | `false` | no |
| <a name="input_network_project_id"></a> [network\_project\_id](#input\_network\_project\_id) | Network project ID | `string` | n/a | yes |
| <a name="input_node_pools"></a> [node\_pools](#input\_node\_pools) | Node pools. Leave blank to use default preemptible and regular node pools | `list(map(string))` | `[]` | no |
| <a name="input_node_pools_labels"></a> [node\_pools\_labels](#input\_node\_pools\_labels) | Node pool labels | `map(map(string))` | <pre>{<br>  "all": {},<br>  "general-pool": {<br>    "app": "general"<br>  },<br>  "preemptible-pool": {<br>    "app": "preemptible"<br>  }<br>}</pre> | no |
| <a name="input_node_pools_metadata"></a> [node\_pools\_metadata](#input\_node\_pools\_metadata) | Node pool meta data | `map(map(string))` | `{}` | no |
| <a name="input_node_pools_oauth_scopes"></a> [node\_pools\_oauth\_scopes](#input\_node\_pools\_oauth\_scopes) | Node pool OAuth scopes | `map(list(string))` | <pre>{<br>  "all": [<br>    "https://www.googleapis.com/auth/cloud-platform",<br>    "https://www.googleapis.com/auth/devstorage.read_only"<br>  ]<br>}</pre> | no |
| <a name="input_node_pools_tags"></a> [node\_pools\_tags](#input\_node\_pools\_tags) | Node pool tags | `map(list(string))` | `{}` | no |
| <a name="input_pods_range_name"></a> [pods\_range\_name](#input\_pods\_range\_name) | Pods Secondary Name | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | GCP Region | `string` | `"us-central1"` | no |
| <a name="input_regional"></a> [regional](#input\_regional) | Regional or Zonal cluster | `string` | `true` | no |
| <a name="input_release_channel"></a> [release\_channel](#input\_release\_channel) | GKE Release Channel | `string` | `"REGULAR"` | no |
| <a name="input_security_policy_name"></a> [security\_policy\_name](#input\_security\_policy\_name) | Name of Cloud Armor US Only security policy | `string` | `"us-only"` | no |
| <a name="input_services_range_name"></a> [services\_range\_name](#input\_services\_range\_name) | Services Secondary Name | `string` | n/a | yes |
| <a name="input_ssl_policy_name"></a> [ssl\_policy\_name](#input\_ssl\_policy\_name) | Name of SSL policy | `string` | `"tls-12"` | no |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | GKE Subnet name | `string` | n/a | yes |
| <a name="input_use_anthos"></a> [use\_anthos](#input\_use\_anthos) | Whether or not cluster gets registered with Anthos and installs Config Management | `bool` | `false` | no |
| <a name="input_use_gke"></a> [use\_gke](#input\_use\_gke) | Whether or not cluster gets created | `bool` | `true` | no |
| <a name="input_zones"></a> [zones](#input\_zones) | GKE Cluster Zones | `list(string)` | <pre>[<br>  "us-central1-a",<br>  "us-cantral1-b"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_primary_cluster_name"></a> [primary\_cluster\_name](#output\_primary\_cluster\_name) | GKE failover cluster name |
<!-- END_TF_DOCS -->