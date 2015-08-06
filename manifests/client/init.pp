# == Class: puppet
#
#	Perform initials setups for a puppet server and/or client
#
# === Parameters
#
#
# [is_client]
#   bool, specify whether you are configuring a puppet client (default: false)
#
# [is_server]
#   bool, specify whether you are configuring a puppet server (default: false)
#
# === Variables
#
#  none
#
# === Examples
#
#       class { puppet:
#               $is_client => true,
#               $is_server => false,
#       }
#
# === Authors
#
#	cyrus
#
# === Copyright
#
# Copyright 2013 cyrus, unless otherwise noted.
#
# [Remember: no empty lines between comments and class definition]
class puppet::client::init ( 
  $service_enable = $puppet::params::service_client_enable,
  $service_ensure = $puppet::params::service_client_ensure,
  $package_ensure = $puppet::params::package_client_ensure,
  $server,
  $ca_server = undef,
  $port,
  $environment
  ) inherits puppet::params {

  # call sub classes
  class { 'puppet::client::package':
    ensure => $package_ensure,
  }
  class { 'puppet::client::service':
    ensure => $service_ensure,
    enable => $servivce_enable,
  }
  class { 'puppet::client::config':
    server      => $server,
    ca_server   => $ca_server,
    port        => $port,
    environment => $environment,
  }

}
