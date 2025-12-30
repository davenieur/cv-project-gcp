provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_storage_bucket" "website" {
  name          = var.bucket_name
  location      = "US"
  force_destroy = true

  website {
    main_page_suffix = "index.html"
  }
}

resource "google_storage_bucket_iam_member" "public_access" {
  bucket = google_storage_bucket.website.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}

terraform {
  backend "gcs" {
    bucket  = "cv-project-dpr-30122025v2" # El nombre del bucket que acabas de crear
    prefix  = "terraform/state"
  }
}