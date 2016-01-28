# == Class: midonet::midonet_agent
#
# Install and run midonet_agent
#
# midonet::midonet_agent::zk_servers:
#     - ip: 'host1'
#       port: 2183
#     - ip: 'host2'
# midonet::midonet_agent::cassandra_seeds:
#     - 'host1'
#     - 'host2'
class midonet::midonet_agent (
  $zk_servers = $::midonet::params::zookeeper_servers,
  $cs_seeds   = $::midonet::params::cassandra_seeds,
) inherits midonet::params {

  class {'midonet::midonet_agent::install': }

  class {'midonet::midonet_agent::run':
      zk_servers => $zk_servers,
      cs_seeds   => $cs_seeds,
  }

}

