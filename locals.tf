
locals {
  use_gke      = var.use_gke
  use_failover = var.use_gke && var.use_failover
  use_kms_keys = var.create_kms_keys && var.encrypt_etcd
  use_anthos   = local.use_gke && var.use_anthos

  acm_git_repo = "git@github.com:${var.github_owner}/${var.acm_repo_name}.git"
  git_branch   = var.lifecycle_name == "prod" ? "main" : var.lifecycle_name

  general_pool = {
    name               = "general-pool"
    machine_type       = var.general_machine_type
    min_count          = 0
    max_count          = var.max_regular
    local_ssd_count    = 0
    disk_size_gb       = 50
    disk_type          = var.disk_type
    image_type         = var.image_type
    auto_repair        = true
    auto_upgrade       = true
    service_account    = var.gke_node_sa
    preemptible        = false
    initial_node_count = var.initial_node_count
  }

  preemptible_pool = {
    name               = "preemptible-pool"
    machine_type       = var.preemptible_machine_type
    min_count          = 0
    max_count          = var.max_preemptible
    local_ssd_count    = 0
    disk_size_gb       = 50
    disk_type          = var.disk_type
    image_type         = var.image_type
    auto_repair        = true
    auto_upgrade       = true
    service_account    = var.gke_node_sa
    preemptible        = true
    initial_node_count = var.initial_node_count
  }

  default_pools = var.use_preemptible ? [local.general_pool, local.preemptible_pool] : [local.general_pool]

  node_pools = length(var.node_pools) == 0 ? local.default_pools : var.node_pools
}


