resource "helm_release" "main" {
  name       = "mediawiki"
  namespace  = kubernetes_namespace.main.id
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "mediawiki"
  version    = "14.3.16"
  values = [
    <<-EOT
      mariadb:
        enabled: false
      externalDatabase:
        host: "${azurerm_postgresql_server.main.fqdn}"
        user: "${azurerm_postgresql_server.main.administrator_login}@${azurerm_postgresql_server.main.name}"
        password: "${azurerm_postgresql_server.main.administrator_login_password}"
        database: "${azurerm_postgresql_database.main.name}"
    EOT
  ]

}
