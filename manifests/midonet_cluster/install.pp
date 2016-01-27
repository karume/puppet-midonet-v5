# == Class: midonet::midonet-cluster::install
# Check out the midonet::midonet-cluster class for a full understanding of
# how to use the midonet-cluster resource

class midonet::midonet_cluster::install (
) inherits midonet::params {

  package { 'midonet-cluster':
    ensure  => present,
  }

}

