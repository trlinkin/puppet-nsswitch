# This module creates a /etc/nsswitch.conf file whith all the lines that
# determine the sources from which to obtain name-service information in a range
# of categories, and in what order. For further information look into manual
# pages.
#
# @param aliases
#   Mail aliases, used by getaliasent() and related functions.
#
# @param automount
#   Which conventions to use for automounting of homes.
#1
# @param bootparams
#   Where bootparams shall be supplied from (e.g. for diskless clients at boot
#   time using rpc.bootparamd).
#
# @param ethers
#   Ethernet numbers.
#
# @param group
#   Groups of users, used by getgrent() and related functions.
#
# @param gshadow
#   Shadow groups, used by getspnam() and related functions.
#
# @param hosts
#   Host names and numbers, used by gethostbyname() and related functions.
#
# @param netgroup
#   Network-wide list of hosts and users, used for access rules.
#
# @param netmasks
#   Netmasks specify how much of the address to reserve for sub-dividing
#   networks into subnetworks.
#
# @param network
#   Network names and numbers, used by getnetent() and related functions.
#
# @param passwd
#   User passwords, used by getpwent() and related functions.
#
# @param protocols
#   Network protocols, used by getprotoent() and related functions.
#
# @param publickey
#   Public and secret keys for Secure_RPC used by NFS and NIS+.
#
# @param services
#   Remote procedure call names and numbers, used by getrpcbyname() and related
#   functions.
#
# @param services
#   Network services, used by getservent() and related functions.
#
# @param shadow
#   Shadow user passwords, used by getspnam() and related functions.
#
# @param sudoers
#   Sudoers policy module users.
#
# @example
#  include nsswitch
#
#  class { 'nsswitch':
#    passwd => ['ldap','files'],
#    hosts  => ['dns [!UNAVAIL=return]','files'],
#  }
#
# @author Thomas Linkin <tom@puppetlabs.com>
# @author Marcellus Siegburg <msiegbur@imn.htwk-leipzig.de>
#
# Copyright 2013 Thomas Linkin, Marcellus Siegburg
#
class nsswitch (
  Optional[Variant[String,Array[String]]] $aliases    = undef,
  Optional[Variant[String,Array[String]]] $automount  = undef,
  Optional[Variant[String,Array[String]]] $bootparams = undef,
  Optional[Variant[String,Array[String]]] $ethers     = undef,
  Optional[Variant[String,Array[String]]] $group      = undef,
  Optional[Variant[String,Array[String]]] $gshadow    = undef,
  Optional[Variant[String,Array[String]]] $hosts      = undef,
  Optional[Variant[String,Array[String]]] $netgroup   = undef,
  Optional[Variant[String,Array[String]]] $netmasks   = undef,
  Optional[Variant[String,Array[String]]] $networks   = undef,
  Optional[Variant[String,Array[String]]] $passwd     = undef,
  Optional[Variant[String,Array[String]]] $protocols  = undef,
  Optional[Variant[String,Array[String]]] $publickey  = undef,
  Optional[Variant[String,Array[String]]] $rpc        = undef,
  Optional[Variant[String,Array[String]]] $services   = undef,
  Optional[Variant[String,Array[String]]] $shadow     = undef,
  Optional[Variant[String,Array[String]]] $sudoers    = undef,
) {

  file { '/etc/nsswitch.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('nsswitch/nsswitch.conf.erb'),
  }
}
