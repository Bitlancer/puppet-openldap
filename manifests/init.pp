# == Class: openldap
#
# This class installs the OpenLDAP client software
#
# === Parameters
#
# [*client_packages*]
#   Specify one or more client packages as an array
#
# [*package_ensure*]
#   Ensure value for packages
#
# [*server_packages*]
#   Specify one or more server packages as an array
#
# [*service_name*]
#   The service name of the slapd service
#
# === Variables
#
# === Examples
#
# === Authors
#
# Bitlancer LLC (contact@bitlancer.com)
#
class openldap(
  $client_packages = $openldap::params::client_packages,
  $package_ensure  = $openldap::params::package_ensure,
  $server_packages = $openldap::params::server_packages,
  $service_name    = $openldap::params::service_name
) inherits openldap::params{

  package { 'openldap_client':
    ensure => $package_ensure,
    name   => $client_packages,
  }

}
