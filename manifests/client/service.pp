class puppet::client::service (
  $ensure = $puppet::params::service_client_ensure,
  $enable = $puppet::params::service_client_enable ) inherits puppet::params {

  # manage the puppet agent service
  service {
    'puppet-agent':
    ensure     => $ensure,
    name       => $puppet::params::service_client_name,
    enable     => $enable,
    hasrestart => $puppet::params::service_client_hasrestart;
  }

}
