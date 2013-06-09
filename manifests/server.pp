# == Class: openldap::server
#
# This class installs and manages the OpenLDAP server
#
# === Parameters
#
# [*enabled*]
#   Defaults to true, boolean to set service ensure
#
# [*package_ensure*]
#   Ensure value for packages
#
# [*package_name*]
#   The name of the server packages
#
# === Variables
#
# === Examples
#
# === Authors
#
# Bitlancer LLC (contact@bitlancer.com)
#
class openldap::server(
  $enabled         = true,
  $package_ensure  = $openldap::package_ensure,
  $package_name    = $openldap::server_packages,
  $service_name    = $openldap::service_name
) inherits openldap{

  package { 'openldap-server':
    ensure => $package_ensure,
    name   => $package_name,
  }

  if $enabled {
    $service_ensure = 'running'
  } else {
    $service_ensure = 'stopped'
  }

  service { 'slapd':
    ensure  => $service_ensure,
    name    => $service_name,
    enable  => $enabled,
    require => Package['openldap-server'],
  }

}
