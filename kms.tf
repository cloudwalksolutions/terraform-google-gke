
module "kms" {
  count = var.create_kms_keys ? 1 : 0

  source = "terraform-google-modules/kms/google"

  project_id      = var.gke_project_id
  location        = var.region
  prevent_destroy = var.lifecycle_name != "prod" ? false : true
  keyring         = "gke-encrypt-etcd"

  keys = local.use_gke || true ? [
    "primary",
  ] : []

  set_owners_for = local.use_gke || true ? [
    "primary",
  ] : []

  owners = local.use_gke || true ? [
    "serviceAccount:service-${var.gke_project_number}@container-engine-robot.iam.gserviceaccount.com",
  ] : []
}


module "failover_kms" {
  count = var.create_kms_keys ? 1 : 0

  source = "terraform-google-modules/kms/google"

  project_id      = var.gke_project_id
  location        = var.failover_region
  prevent_destroy = var.lifecycle_name != "prod" ? false : true
  keyring         = "gke-encrypt-etcd-failover"

  keys = local.use_failover ? [
    "failover",
  ] : []

  set_owners_for = local.use_failover ? [
    "failover",
  ] : []

  owners = local.use_failover ? [
    "serviceAccount:service-${var.gke_project_number}@container-engine-robot.iam.gserviceaccount.com",
  ] : []
}

