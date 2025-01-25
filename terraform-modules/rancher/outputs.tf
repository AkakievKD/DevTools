output "rancher2_cluster_id" {
  value = {
    for key in keys(rancher2_cluster.cluster) : key => rancher2_cluster.cluster[key].id
  }
}

output "rancher2_project_id" {
  value = {
    for key in keys(rancher2_project.project) : key => rancher2_project.project[key].id
  }
}
