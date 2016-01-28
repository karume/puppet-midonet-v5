# == Class: midonet::midonet_cluster
#
# Install and run midonet_cluster

class midonet::midonet_cluster (
  $zk_servers      = $::midonet::params::zookeeper_servers,
  $cassandra_seeds = $::midonet::params::cassandra_seeds,
) inherits midonet::params {

  class { 'midonet::midonet_cluster::install': }

  class { 'midonet::midonet_cluster::run':
    zk_servers => $zk_servers,
    cs_seeds   => $cassandra_seeds,
  }

}

