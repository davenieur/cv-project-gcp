variable "project_id" {
  description = "El ID del proyecto de GCP"
  type        = string
}

variable "region" {
  description = "Región donde se crearán los recursos"
  type        = string
  default     = "us-central1"
}

variable "bucket_name" {
  description = "Nombre único para el bucket del sitio web"
  type        = string
}