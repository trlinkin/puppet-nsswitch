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
  $aliases    = $nsswitch::params::aliases_default,
  $automount  = $nsswitch::params::automount_default,
  $bootparams = $nsswitch::params::bootparams_default,
  $ethers     = $nsswitch::params::ethers_default,
  $group      = $nsswitch::params::group_default,
  $hosts      = $nsswitch::params::hosts_default,
  $netgroup   = $nsswitch::params::netgroup_default,
  $netmasks   = $nsswitch::params::netmasks_default,
  $networks   = $nsswitch::params::networks_default,
  $passwd     = $nsswitch::params::passwd_default,
  $protocols  = $nsswitch::params::protocols_default,
  $publickey  = $nsswitch::params::publickey_default,
  $rpc        = $nsswitch::params::rpc_default,
  $services   = $nsswitch::params::services_default,
  $shadow     = $nsswitch::params::shadow_default,
  $sudoers    = $nsswitch::params::sudoers_default,
) inherits nsswitch::params {

  # Determine the value for Aliases
  if $aliases {
    validate_multi($aliases,'string','array')
  }
  # Determine the value for Auto Mounting
  if $automount {
    validate_multi($automount,'string','array')
  }
  # Determine the value for Boot Params
  if $bootparams {
    validate_multi($bootparams,'string','array')
  }
  # Determine the value for Ethers
  if $ethers {
    validate_multi($ethers,'string','array')
  }
  # Determine the value for Groups
  if $group {
    validate_multi($group,'string','array')
  }
  # Determine the value for Hosts
  if $hosts {
    validate_multi($hosts,'string','array')
  }
  # Determine the value for Netgroup
  if $netgroup {
    validate_multi($netgroup,'string','array')
  }
  # Determine the value for Netmasks
  if $netmasks {
    validate_multi($netmasks,'string','array')
  }
  # Determine the value for Networks
  if $networks {
    validate_multi($networks,'string','array')
  }
  # Determine the value for PASSWD
  if $passwd  {
    validate_multi($passwd,'string','array')
  }
  # Determine the value for Protocols
  if $protocols {
    validate_multi($protocols,'string','array')
  }
  # Determine the value for Public Key
  if $publickey {
    validate_multi($publickey,'string','array')
  }
  # Determine the value for RPC
  if $rpc {
    validate_multi($rpc,'string','array')
  }
  # Determine the value for Services
  if $services {
    validate_multi($services,'string','array')
  }
  # Determine the value for Shadow
  if $shadow {
    validate_multi($shadow,'string','array')
  }
  # Determine the value for Sudoers
  if $sudoers {
    validate_multi($sudoers,'string','array')
  }

  file { $nsswitch::params::nsswitch_path:
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('nsswitch/nsswitch.conf.erb'),
  }
}
