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
class puppet { 

  # empty class
}
