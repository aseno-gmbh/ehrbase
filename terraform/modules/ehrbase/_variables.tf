variable "enabled" {
  type    = bool
  default = false
}
variable "namespace" {
  type        = string
  description = "Kubernetes namespace to deploy this helm chart & other modules."
}

###############################################################
#### DATABASE
###############################################################
variable "db_name" {
  description = "Database name"
  type        = string
  default     = "ehrbase"
}
variable "db_username" {
  type        = string
  default     = "postgres"
  description = "DB-MasterUser AWS RDS"
}

variable "db_password" {
  type      = string
  sensitive = true
  default     = "postgres"
  description = "DB-MasterUserPwd AWS RDS"
}
variable "db_port" {
  description = "Username for the master DB user"
  type        = string
  default     = "5432"
}

#### openEHR own DB
variable image_registry {
  type        = string
  default     = "docker.io"
  description = "description"
}
variable docker_image {
  type        = string
  description = "description"
}

