# ---------------------------------------------------------------------------------------------------------------------
# CREATE A CLOUD RUN
# ---------------------------------------------------------------------------------------------------------------------

resource "google_cloud_run_service" "default" {
  name     = var.cloudrun_srv_name
  location = var.location

  template {
    spec {
      containers {
        image = "${var.gcr_region}.gcr.io/${var.project_id}/${var.image_name}:${var.image_tag}"
        resources {
          limits = {
            cpu    = "4"
            memory = "8Gi"
          }
        }
        ports {
          container_port = var.container_port
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  autogenerate_revision_name = true
}

data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location = google_cloud_run_service.default.location
  project  = google_cloud_run_service.default.project
  service  = google_cloud_run_service.default.name

  policy_data = data.google_iam_policy.noauth.policy_data
}