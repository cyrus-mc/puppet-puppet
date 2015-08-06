class puppet::client::config ( 
  $server, 
  $ca_server,
  $port,
  $environment 
  ) inherits puppet::params {

  # validate ca_server, set to server if not supplied
  if $ca_server and $ca_server != '' {
    $real_ca_server = $ca_server
  } else {
    $real_ca_server = $server
  }

  # configure puppet.conf for puppet agent
  file { 
    "${puppet::params::config_path}/puppet.conf":
    content => template('puppet/puppet.client.conf.erb'),
    notify => Service [ 'puppet-agent' ];
  }
  

}
