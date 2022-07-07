
# ---------------------------------------------------------------------------------------------------------------------
# SETUP TERRAFORM CLOUD FOR STORING STATE
# ---------------------------------------------------------------------------------------------------------------------

terraform {
	backend "remote" {
		organization = "org"
		workspaces {
				name = "org-production"
		}
	}
}

# ---------------------------------------------------------------------------------------------------------------------
# SETUP PROVIDER
# ---------------------------------------------------------------------------------------------------------------------

provider "google" {
	project = var.project_id
	region  = var.region
	zone    = var.zone
}

# ---------------------------------------------------------------------------------------------------------------------
# Module for create Cloud Run each service
# ---------------------------------------------------------------------------------------------------------------------

resource "google_container_cluster" "primary" {

	name     = "org-gke-cluster-prod"
	location = "asia-southeast1"

	# We can't create a cluster with no node pool defined, but we want to only use
	# separately managed node pools. So we create the smallest possible default
	# node pool and immediately delete it.
	remove_default_node_pool = true
	initial_node_count       = 1

	master_auth {
		username = "username"
		password = "password"

		client_certificate_config {
			issue_client_certificate = false
		}
	}
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
	name       = "org-node-pool-prod"
	location   = "asia-southeast1"
	cluster    = google_container_cluster.primary.name
	node_count = 1

	node_config {
		preemptible  = false
		machine_type = "n1-standard-1"

		metadata = {
			disable-legacy-endpoints = "true"
		}

		oauth_scopes = [
		"https://www.googleapis.com/auth/logging.write",
		"https://www.googleapis.com/auth/monitoring",
		]
	}
}