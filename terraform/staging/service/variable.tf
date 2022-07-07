variable "project_id" {}

variable "project_name" {
  description = "The project name where all resources will be launched."
  type        = string
}

variable "location" {
  description = "The location to deploy the Cloud Run services. Note: Be sure to pick a region that supports Cloud Run."
  type        = string
}

variable "gcr_region" {
  description = "Name of the GCP region where the GCR registry is located. e.g: 'us' or 'eu'."
  type        = string
}

variable "cloudrun_srv_name" {
  description = "The name of the Cloud Run service to deploy."
  type        = string
  default     = "config-service"
}

variable "image_name" {
  description = "The name of the image to deploy. Defaults to a publically available image."
  type        = string
  default     = "base-image"
}

variable "image_tag" {
  description = "The tag of the image to deploy. Defaults to lastest image."
  type        = string
  default     = "latest"
}

variable "container_port" {
  description = "The port for running container. Detaults to 5000 (staging)"
  type        = number
  default     = 5000
}