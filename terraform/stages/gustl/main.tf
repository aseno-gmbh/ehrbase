module "ehrbase-postgres" {
  source       = "../../modules/ehrbase-postgres"
  docker_image = var.docker_image_db
  namespace    = var.namespace
  depends_on   = [kubernetes_namespace.ehrbase]
}

module "ehrbase" {
  source       = "../../modules/ehrbase"
  docker_image = var.docker_image_app
  namespace    = var.namespace
  depends_on   = [module.ehrbase-postgres, kubernetes_namespace.ehrbase]
}
