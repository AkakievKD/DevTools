output "grafana_folder_id" {
  value = {
    for key in keys(grafana_folder.folder) : key => grafana_folder.folder[key].id
  }
}
