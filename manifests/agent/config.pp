# Class: puppet::agent::config
#
# This class manages the configuration of the puppet agent
#
# Requires:
#
class puppet::agent::config ( 
  $server, 
  $ca_server,
  $port,
  $environment
  ) inherits puppet::params {

  # validate parameters
  if !is_domain_name($server) {
    fail('Supplied server parameter must be a valid hostname')
  }

  if !is_string($environment) or $environment == '' {
    fail('Supplied environment parameter must be a valid non-empty string')
  }

  if !is_integer($port) {
    fail('Supplied port must be an integer')
  }

  # validate ca_server, set to server if not supplied
  if $ca_server and $ca_server != '' {
    $real_ca_server = $ca_server
  } else {
    $real_ca_server = $server
  }

  if !is_domain_name($real_ca_server) {
    fail('Supplied ca_server parameter must be a valid hostname')
  }

  # configure puppet.conf for puppet agent
  file { 
    "${puppet::params::config_path}/puppet.conf":
    content => template('puppet/puppet.agent.conf.erb'),
    notify => Service[ 'puppet-agent' ];
  }
  

}
