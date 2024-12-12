resource "helm_release" "postgresql" {
  name             = "ehrbase-postgres"
  #repository = var.helm_chart_repo
  repository = "ehrbase-postgres"
  #chart      = var.helm_chart_name
  chart      = "${path.module}/helmcharts"
  #version    = var.helm_chart_version
  namespace = var.namespace
  
  atomic = true # default false
  
  #   values = [
  #     "${file("${path.module}/config/values.yaml")}"
  #   ]
  set {
    name  = "global.imageRegistry"
    value = var.image_registry
  }
  set {
    name  = "deployment.image"
    value = var.docker_image
  }
  # set {
  #   name  = "global.postgresql.auth.postgresPassword"
  #   value = var.db_password
  # }
  # set {
  #   name  = "global.postgresql.auth.username"
  #   value = var.db_username
  # }
  # set {
  #   name  = "global.postgresql.auth.password"
  #   value = var.db_password
  # }
  # # auth.database
  # set {
  #   name  = "global.postgresql.auth.database"
  #   value = var.db_name
  # }
  # set {
  #   name  = "containerPorts.postgresql"
  #   value = var.db_port
  # }

  # ## @param global.storageClass Global StorageClass for Persistent Volume(s)
  # ## @param primary.persistence.storageClass PVC Storage Class for PostgreSQL Primary data volume
  # ## @param readReplicas.persistence.storageClass PVC Storage Class for PostgreSQL read only data
  # set {
  #   name  = "global.storageClass"
  #   value = "nfs"
  # }
  # set {
  #   name  = "primary.persistence.storageClass"
  #   value = "nfs"
  # }
  # set {
  #   name  = "readReplicas.persistence.storageClass"
  #   value = "nfs"
  # }
 
}