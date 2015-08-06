# Class: puppet::agent::package
#
# This class manages the puppet agent package installation
#
# Requires:
#
class puppet::agent::package ( $ensure = $puppet::params::package_agent_ensure ) inherits puppet::params {

  # validate parameters
  if !is_string($puppet::params::package_agent) and !is_array($puppet::params::package_agent) {
    fail('pupet::params::package_agent must be a string or an array of packages to install')
  }

  # install necessary package
  package { $puppet::params::package_agent:
    ensure => $ensure,
  }

}
