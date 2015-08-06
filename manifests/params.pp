# == Class: puppet::params
#
#	Puppet module parameters class. 
#
# === Parameters
#
#  none
#
# === Variables
#
#  none
#
# === Examples
#
#  class { puppet::params: }
#
# === Authors
#
# cyrus
#
# === Copyright
#
# Copyright 2013 cyrus, unless otherwise noted.
#
# [Remember: no empty lines between comments and class definition]
class puppet::params {
	
  # non-OS specific default parameters
  $package_client_ensure         = hiera('puppet::client::package_ensure', 'present')
  $service_client_ensure         = hiera('puppet::client::service_ensure', 'running')
  $service_client_enable         = hiera('puppet::client::service_enable', true)
  
  case $::osfamily {

    'RedHat': {
      $package_client            = hiera('puppet::client::package', 'puppet')
      $package_server            = hiera('puppet::server::package', 'puppet-server')
      $service_client_name       = hiera('puppet::client::service_name', 'puppet')
      $service_server_name       = hiera('puppet::server::service_name', 'puppetmaster')
      $service_client_hasrestart = hiera('puppet::client::service_hasrestart', true)

      $config_path               = hiera('puppet::config_path', '/etc/puppet')
    }

    default: {
      fail("${module_name} : unsupported OS family ${::osfamily}")
    }

  }

}
