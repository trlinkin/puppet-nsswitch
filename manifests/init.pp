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
#   *Variant* (defaults to $nsswitch::params::aliases_default)
#
# [*automount*]
#
#   Which conventions to use for automounting of homes.
#   *Variant* (defaults to $nsswitch::params::automount_default)
#
# [*bootparams*]
#
#   Where bootparams shall be supplied from (e.g. for diskless clients at boot
#   time using rpc.bootparamd).
#   *Variant* (defaults to $nsswitch::params::bootparams_default)
#
# [*ethers*]
#
#   Ethernet numbers.
#   *Variant* (defaults to $nsswitch::params::ethers_default)
#
# [*group*]
#
#   Groups of users, used by getgrent() and related functions.
#   *Variant* (defaults to $nsswitch::params::group_default)
#
# [*gshadow*]
#
#   Shadow groups, used by getspnam() and related functions.
#   *Variant* (defaults to $nsswitch::params::gshadow_default)
#
# [*hosts*]
#
#   Host names and numbers, used by gethostbyname() and related functions.
#   *Variant* (defaults to $nsswitch::params::hosts_default)
#
# [*netgroup*]
#
#   Network-wide list of hosts and users, used for access rules.
#   *Variant* (defaults to $nsswitch::params::netgroup_default)
#
# [*netmasks*]
#
#   Netmasks specify how much of the address to reserve for sub-dividing
#   networks into subnetworks.
#   *Variant* (defaults to $nsswitch::params::netmasks_default)
#
# [*network*]
#
#   Network names and numbers, used by getnetent() and related functions.
#   *Variant* (defaults to $nsswitch::params::network_default)
#
# [*passwd*]
#
#   User passwords, used by getpwent() and related functions.
#   *Variant* (defaults to $nsswitch::params::passwd_default)
#
# [*protocols*]
#
#   Network protocols, used by getprotoent() and related functions.
#   *Variant* (defaults to $nsswitch::params::protocols_default)
#
# [*publickey*]
#
#   Public and secret keys for Secure_RPC used by NFS and NIS+.
#   *Variant* (defaults to $nsswitch::params::rpc_default)
#
# [*services*]
#
#   Remote procedure call names and numbers, used by getrpcbyname() and related
#   functions.
#   *Variant* (defaults to $nsswitch::params::rpc_default)
#
# [*services*]
#
#   Network services, used by getservent() and related functions.
#   *Variant* (defaults to $nsswitch::params::services_default)
#
# [*shadow*]
#
#   Shadow user passwords, used by getspnam() and related functions.
#   *Variant* (defaults to $nsswitch::params::shadow_default)
#
# [*sudoers*]
#
#   Sudoers policy module users.
#   *Variant* (defaults to $nsswitch::params::sudoers_default)
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
  Variant[String, Array, Undef] $aliases    = $nsswitch::params::aliases_default,
  Variant[String, Array, Undef] $automount  = $nsswitch::params::automount_default,
  Variant[String, Array, Undef] $bootparams = $nsswitch::params::bootparams_default,
  Variant[String, Array, Undef] $ethers     = $nsswitch::params::ethers_default,
  Variant[String, Array, Undef] $group      = $nsswitch::params::group_default,
  Variant[String, Array, Undef] $hosts      = $nsswitch::params::hosts_default,
  Variant[String, Array, Undef] $netgroup   = $nsswitch::params::netgroup_default,
  Variant[String, Array, Undef] $netmasks   = $nsswitch::params::netmasks_default,
  Variant[String, Array, Undef] $networks   = $nsswitch::params::networks_default,
  Variant[String, Array, Undef] $passwd     = $nsswitch::params::passwd_default,
  Variant[String, Array, Undef] $protocols  = $nsswitch::params::protocols_default,
  Variant[String, Array, Undef] $publickey  = $nsswitch::params::publickey_default,
  Variant[String, Array, Undef] $rpc        = $nsswitch::params::rpc_default,
  Variant[String, Array, Undef] $services   = $nsswitch::params::services_default,
  Variant[String, Array, Undef] $shadow     = $nsswitch::params::shadow_default,
  Variant[String, Array, Undef] $gshadow    = $nsswitch::params::gshadow_default,
  Variant[String, Array, Undef] $sudoers    = $nsswitch::params::sudoers_default,
) inherits nsswitch::params {

  file { 'nsswitch.conf':
    ensure  => file,
    path    => '/etc/nsswitch.conf',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => epp('nsswitch/nsswitch.conf.epp'),
  }
}
