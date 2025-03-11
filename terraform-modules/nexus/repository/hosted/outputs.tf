output "nexus_repository_docker_hosted_name" {
  value = {
    for key, value in nexus_repository_docker_hosted.repository_docker_hosted : key => value.name
  }
}

output "nexus_repository_pypi_hosted_name" {
  value = {
    for key, value in nexus_repository_pypi_hosted.repository_pypi_hosted : key => value.name
  }
}

output "nexus_repository_npm_hosted_name" {
  value = {
    for key, value in nexus_repository_npm_hosted.repository_npm_hosted : key => value.name
  }
}

output "nexus_repository_nuget_hosted_name" {
  value = {
    for key, value in nexus_repository_nuget_hosted.repository_nuget_hosted : key => value.name
  }
}
