resource "google_project_iam_member" "iap_role" {
  role   = "roles/iap.tunnelResourceAccessor"
  member = "serviceAccount:${google_project_service_account.gke_service_account.email}"
  project = var.project_id
}

resource "google_project_service_account" "gke_service_account" {
  account_id   = "gke-service-account"
  display_name = "GKE Service Account"
}


resource "google_project_iam_binding" "iap_service_account_binding" {
  role    = "roles/iap.tunnelResourceAccessor"
  members = ["serviceAccount:${google_project_service_account.gke_service_account.email}"]
  project = var.project_id
}
