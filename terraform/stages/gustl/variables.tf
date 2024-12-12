variable "create_namespace" {
  type    = bool
  default = true
}
variable "namespace" {
  type        = string
  default     = "ehrbase"
  description = "Kubernetes namespace to deploy this helm chart & other modules."
}
variable "docker_image_db" {
  type        = string
  default     = "ehrbase/ehrbase-v2-postgres:16.2"
  description = "description"
}
variable "docker_image_app" {
  type        = string
  default     = "ehrbase/ehrbase"
  description = "description"
}
variable "k8s_config_path" {
  type        = string
  default     = "~/.kube/github-gustl-rke2.yaml"
  description = "Configfile for access kubernetes (k8s)"
}
variable "k8s_config_context" {
  type        = string
  default     = "local"
  description = "Configfile for access kubernetes (k8s)"
}

