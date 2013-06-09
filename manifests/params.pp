# == Class: openldap::params
#
# The OpenLDAP configuration settings
#
# === Parameters
#
# === Variables
#
# === Examples
#
# === Authors
#
# Bitlancer LLC (contact@bitlancer.com)
#
class openldap::params {

  $package_ensure = 'present'

  case $::osfamily {
    'Redhat': {
      $client_packages = [ 'openldap', 'openldap-clients' ]
      $server_packages = [ 'openldap-servers' ]
      $service_name    = 'slapd'
    }

    default: {
      fail("Unsupported osfamily: ${::osfamily} operatingsystem: ${::operatingsystem}, module ${module_name} only support osfamily RedHat")
    }
  }

}
