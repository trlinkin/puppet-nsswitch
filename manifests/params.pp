# == Class: nsswitch::params
#
# Provides default values for the nsswitch module according to the
# operatingsystem being used.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#
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
class nsswitch::params {

  case $::operatingsystem {
    /CentOS|RedHat|Amazon|OEL|OracleLinux|Scientific/: {
                $aliases_default    = ['files','nisplus']
                $automount_default  = ['files','nisplus']
                $bootparams_default = ['nisplus [NOTFOUND=return]','files']
                $ethers_default     = ['files']
                $group_default      = ['files']
                $hosts_default      = ['files','dns']
                $netgroup_default   = ['nisplus']
                $netmasks_default   = ['files']
                $networks_default   = ['files']
                $passwd_default     = ['files']
                $protocols_default  = ['files']
                $publickey_default  = ['nisplus']
                $rpc_default        = ['files']
                $services_default   = ['files']
                $shadow_default     = ['files']
                $sudoers_default    = undef
    }
    'Fedora': {
                $aliases_default    = ['files','nisplus']
                $automount_default  = ['files','nisplus']
                $bootparams_default = ['nisplus [NOTFOUND=return]','files']
                $ethers_default     = ['files']
                $group_default      = ['files']
                $hosts_default      = ['files',
                                      'mdns4_minimal [NOTFOUND=return]',
                                      'dns']
                $netgroup_default   = ['nisplus']
                $netmasks_default   = ['files']
                $networks_default   = ['files']
                $passwd_default     = ['files']
                $protocols_default  = ['files']
                $publickey_default  = ['nisplus']
                $rpc_default        = ['files']
                $services_default   = ['files']
                $shadow_default     = ['files']
                $sudoers_default    = undef
    }
    /Ubuntu|Debian/: {
                $aliases_default    = undef
                $automount_default  = undef
                $bootparams_default = undef
                $ethers_default     = ['db','files']
                $group_default      = ['compat']
                $hosts_default      = ['files','dns']
                $netgroup_default   = ['nis']
                $netmasks_default   = undef
                $networks_default   = ['files']
                $passwd_default     = ['compat']
                $protocols_default  = ['db','files']
                $publickey_default  = undef
                $rpc_default        = ['db','files']
                $services_default   = ['db','files']
                $shadow_default     = ['compat']
                $sudoers_default    = undef
    }
    'SLES': {
                $aliases_default    = ['files']
                $automount_default  = ['files']
                $bootparams_default = ['files']
                $ethers_default     = ['files']
                $group_default      = ['compat']
                $hosts_default      = ['files','dns']
                $netgroup_default   = ['files']
                $netmasks_default   = ['files']
                $networks_default   = ['files','dns']
                $passwd_default     = ['compat']
                $protocols_default  = ['files']
                $publickey_default  = ['files']
                $rpc_default        = ['files']
                $services_default   = ['files']
                $shadow_default     = undef
                $sudoers_default    = undef
    }
    'Solaris': {
                $passwd_default       = ['files','nisplus']
                $group_default        = ['files','nisplus']
                $hosts_default        = ['files','dns','nisplus']
                $services_default     = ['nisplus','files']
                $networks_default     = ['nisplus','files']
                $protocols_default    = ['nisplus','files']
                $rpc_default          = ['nisplus','files']
                $ethers_default       = ['nisplus','files']
                $netmasks_default     = ['files','nisplus']
                $bootparams_default   = ['nisplus','files']
                $publickey_default    = ['nisplus']
                $netgroup_default     = ['nisplus']
                $automount_default    = ['files','nisplus']
                $aliases_default      = ['files','nisplus']
    }
    'Gentoo': {
                $aliases_default    = ['files']
                $automount_default  = ['files']
                $bootparams_default = ['files']
                $ethers_default     = ['db','files']
                $group_default      = ['compat']
                $hosts_default      = ['files','dns']
                $netgroup_default   = ['files']
                $netmasks_default   = ['files']
                $networks_default   = ['files','dns']
                $passwd_default     = ['compat']
                $protocols_default  = ['db','files']
                $publickey_default  = undef
                $rpc_default        = ['db','files']
                $services_default   = ['db','files']
                $shadow_default     = ['compat']
                $sudoers_default    = undef
    }
    default: {
      fail("${::operatingsystem} is not a supported operating system.")
    }
  }
}
