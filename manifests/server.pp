# Class: puppet::server
#
#	This modules configures a puppet server
#
#	Tested platforms:
#		CentOS v6.0
#		RedHat Enterprise Linux v6.0
#
#	Parameters:
#		client 	=> bool, default false
#		server	=> bool, default false
#	
#	Actions:
#
#	Requires:
#
#	Sample Usage:
#
#		class { "puppet::client::config": 
#			server = 'localhost' 
#    		}
#
# [Remember: no empty lines between comments and class definition]
class puppet::server inherits puppet::params {

        # only run if on a supported platform
        if $puppet::params::supported {

		package { $puppet::params::packages_server:
			ensure  => present,
		}

       	 	# use iptables module to open Puppet server port
        	iptables::rule {
			"10_filter-puppet_server":
			ensure  => present;
		}

	}

}
