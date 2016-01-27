# == Class: midonet::midonet-cluster::run
# Check out the midonet::midonet-cluster class for a full understanding of
# how to use the midonet-cluster resource

class midonet::midonet-cluster::run (
  $zk_hosts = $::midonet::params::zookeeper_hosts,
  $cs_seeds = $::midonet::params::cassandra_seeds,
  $cs_repl_factor  = $::midonet::params::cassandra_replication_factor,
) inherits midonet::params {

  file { 'midonet.conf':
    ensure  => present,
    content => template('midonet/midonet-cluster/midonet.conf.erb'),
    owner   => 'root',
    group   => 'root',
    require => Package['midonet-cluster'],
  }

  service { 'midonet-cluster':
    ensure  => running,
    enable  => true,
    require => File['midonet.conf'],
  }

}

