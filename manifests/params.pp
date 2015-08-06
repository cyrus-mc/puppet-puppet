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
  $package_agent_ensure         = hiera('puppet::agent::package_ensure', 'present')
  $service_agent_ensure         = hiera('puppet::agent::service_ensure', 'running')
  $service_agent_enable         = hiera('puppet::agent::service_enable', true)
  
  case $::osfamily {

    'RedHat': {
      $package_agent            = hiera('puppet::agent::package', 'puppet')
      $package_server           = hiera('puppet::server::package', 'puppet-server')
      $service_agent_name       = hiera('puppet::agent::service_name', 'puppet')
      $service_server_nam       = hiera('puppet::server::service_name', 'puppetmaster')
      $service_agent_hasrestart = hiera('puppet::agent::service_hasrestart', true)

      $config_path              = hiera('puppet::config_path', '/etc/puppet')
    }

    default: {
      fail("${module_name} : unsupported OS family ${::osfamily}")
    }

  }

}
