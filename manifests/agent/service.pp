# Class: puppet::agent::service
#
# This class manages the puppet agent service
#
# Requires:
#
class puppet::agent::service (
  $ensure = $puppet::params::service_agent_ensure,
  $enable = $puppet::params::service_agent_enable ) inherits puppet::params {

  # manage the puppet agent service
  service {
    'puppet-agent':
    ensure     => $ensure,
    name       => $puppet::params::service_agent_name,
    enable     => $enable,
    hasrestart => $puppet::params::service_agent_hasrestart;
  }

}
