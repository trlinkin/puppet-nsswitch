# == Class: nsswitch
#
# This module creates a /etc/nsswitch.conf file whith all the lines that
# determine the sources from which to obtain name-service information in a range
# of categories, and in what order. For further information look into manual
# pages.
#
# === Parameters
#
# [*aliases*]
#
#   Mail aliases, used by getaliasent() and related functions.
#   *Optional* (defaults to $nsswitch::params::aliases_default)
#
# [*automount*]
#
#   Which conventions to use for automounting of homes.
#   *Optional* (defaults to $nsswitch::params::automount_default)
#
# [*bootparams*]
#
#   Where bootparams shall be supplied from (e.g. for diskless clients at boot
#   time using rpc.bootparamd).
#   *Optional* (defaults to $nsswitch::params::bootparams_default)
#
# [*ethers*]
#
#   Ethernet numbers.
#   *Optional* (defaults to $nsswitch::params::ethers_default)
#
# [*group*]
#
#   Groups of users, used by getgrent() and related functions.
#   *Optional* (defaults to $nsswitch::params::group_default)
#
# [*gshadow*]
#
#   Shadow groups, used by getspnam() and related functions.
#   *Optional* (defaults to $nsswitch::params::gshadow_default)
#
# [*hosts*]
#
#   Host names and numbers, used by gethostbyname() and related functions.
#   *Optional* (defaults to $nsswitch::params::hosts_default)
#
# [*netgroup*]
#
#   Network-wide list of hosts and users, used for access rules.
#   *Optional* (defaults to $nsswitch::params::netgroup_default)
#
# [*netmasks*]
#
#   Netmasks specify how much of the address to reserve for sub-dividing
#   networks into subnetworks.
#   *Optional* (defaults to $nsswitch::params::netmasks_default)
#
# [*network*]
#
#   Network names and numbers, used by getnetent() and related functions.
#   *Optional* (defaults to $nsswitch::params::network_default)
#
# [*passwd*]
#
#   User passwords, used by getpwent() and related functions.
#   *Optional* (defaults to $nsswitch::params::passwd_default)
#
# [*protocols*]
#
#   Network protocols, used by getprotoent() and related functions.
#   *Optional* (defaults to $nsswitch::params::protocols_default)
#
# [*publickey*]
#
#   Public and secret keys for Secure_RPC used by NFS and NIS+.
#   *Optional* (defaults to $nsswitch::params::rpc_default)
#
# [*services*]
#
#   Remote procedure call names and numbers, used by getrpcbyname() and related
#   functions.
#   *Optional* (defaults to $nsswitch::params::rpc_default)
#
# [*services*]
#
#   Network services, used by getservent() and related functions.
#   *Optional* (defaults to $nsswitch::params::services_default)
#
# [*shadow*]
#
#   Shadow user passwords, used by getspnam() and related functions.
#   *Optional* (defaults to $nsswitch::params::shadow_default)
#
# [*sudoers*]
#
#   Sudoers policy module users.
#   *Optional* (defaults to $nsswitch::params::sudoers_default)
#
# === Variables
#
# === Examples
#
#  include nsswitch
#
#  class { 'nsswitch':
#    passwd => ['ldap','files'],
#    hosts  => ['dns [!UNAVAIL=return]','files'],
#  }
#
# === Authors
#
# Thomas Linkin <tom@puppetlabs.com>
# Marcellus Siegburg <msiegbur@imn.htwk-leipzig.de>
#
# === Copyright
#
# Copyright 2013 Thomas Linkin, Marcellus Siegburg
#
class nsswitch (
  Array[String] $aliases    = $nsswitch::params::aliases_default,
  Array[String] $automount  = $nsswitch::params::automount_default,
  Array[String] $bootparams = $nsswitch::params::bootparams_default,
  Array[String] $ethers     = $nsswitch::params::ethers_default,
  Array[String] $group      = $nsswitch::params::group_default,
  Array[String] $gshadow    = $nsswitch::params::gshadow_default,
  Array[String] $hosts      = $nsswitch::params::hosts_default,
  Array[String] $netgroup   = $nsswitch::params::netgroup_default,
  Array[String] $netmasks   = $nsswitch::params::netmasks_default,
  Array[String] $networks   = $nsswitch::params::networks_default,
  Array[String] $passwd     = $nsswitch::params::passwd_default,
  Array[String] $protocols  = $nsswitch::params::protocols_default,
  Array[String] $publickey  = $nsswitch::params::publickey_default,
  Array[String] $rpc        = $nsswitch::params::rpc_default,
  Array[String] $services   = $nsswitch::params::services_default,
  Array[String] $shadow     = $nsswitch::params::shadow_default,
  Array[String] $sudoers    = $nsswitch::params::sudoers_default,
) inherits nsswitch::params {
  file { 'nsswitch.conf':
    ensure  => file,
    path    => '/etc/nsswitch.conf',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('nsswitch/nsswitch.conf.erb'),
  }
}
