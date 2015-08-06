# Class: puppet::agent
#
# This class manages the puppet agent (package, service and config)
#
# Requires:
#
class puppet::agent ( 
  $service_enable = $puppet::params::service_agent_enable,
  $service_ensure = $puppet::params::service_agent_ensure,
  $package_ensure = $puppet::params::package_agent_ensure,
  $server,
  $ca_server = undef,
  $port = 8140,
  $environment = 'production'
  ) inherits puppet::params {

  # call sub classes
  class { 'puppet::agent::package':
    ensure => $package_ensure,
  }
  class { 'puppet::agent::service':
    ensure => $service_ensure,
    enable => $servivce_enable,
  }
  class { 'puppet::agent::config':
    server      => $server,
    ca_server   => $ca_server,
    port        => $port,
    environment => $environment,
  }

}
