resource "kubernetes_namespace" "ehrbase" {
  count = var.create_namespace ? 1 : 0
  metadata {
    annotations = {
      name = var.namespace
    }
    # labels = {
    #   "istio.io/rev" = var.istio_version
    # }
    name = var.namespace
  }
}