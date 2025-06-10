
output "primary_cluster" {
  description = "GKE primary cluster"
  value       = var.use_gke ? module.gke[0] : null
  sensitive   = true
}

output "failover_cluster" {
  description = "GKE failover cluster"
  value       = var.use_gke && var.use_failover ? module.failover_gke[0] : null
}
