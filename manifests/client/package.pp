class puppet::client::package ( $ensure = $puppet::params::package_client_ensure ) inherits puppet::params {

  # install necessary package
  package { $puppet::params::package_client:
    ensure => $ensure,
  }

}
