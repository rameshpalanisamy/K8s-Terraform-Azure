resource "kubernetes_namespace" "main" {
  metadata {
    name = "mediawiki"
  }
}
