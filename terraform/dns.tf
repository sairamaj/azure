resource "azurerm_dns_cname_record" "auto" {
  name  = "auto"
  zone_name = "sairama.net"
  resource_group_name = "dnstest"
  ttl = 30
  record = "auto.sairama.net"
}
