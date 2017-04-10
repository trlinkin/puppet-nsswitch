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
    /CentOS|RedHat|Amazon|OEL|OracleLinux|Scientific|CloudLinux/: {
      if $::operatingsystemmajrelease == '7' {
        $passwd_default     = ['files','sss']
        $shadow_default     = ['files','sss']
        $group_default      = ['files','sss']
        $automount_default  = ['files']

        $services_default   = ['files','sss']
        $netgroup_default   = ['files','sss']
      }else{
        $passwd_default     = ['files']
        $shadow_default     = ['files']
        $group_default      = ['files']
        $automount_default  = ['files','nisplus']

        $services_default   = ['files']
        $netgroup_default   = ['nisplus']
      }

      $aliases_default    = ['files','nisplus']
      $bootparams_default = ['nisplus [NOTFOUND=return]','files']
      $ethers_default     = ['files']
      $gshadow_default    = []
      $hosts_default      = ['files','dns']
      $netmasks_default   = ['files']
      $networks_default   = ['files']
      $protocols_default  = ['files']
      $publickey_default  = ['nisplus']
      $rpc_default        = ['files']
      $sudoers_default    = []
    }
    'Fedora': {
      $aliases_default    = ['files','nisplus']
      $automount_default  = ['files','nisplus']
      $bootparams_default = ['nisplus [NOTFOUND=return]','files']
      $ethers_default     = ['files']
      $group_default      = ['files']
      $gshadow_default    = []
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
      $sudoers_default    = []
    }
    /Ubuntu|Debian/: {
      $aliases_default    = []
      $automount_default  = []
      $bootparams_default = []
      $ethers_default     = ['db','files']
      $group_default      = ['compat']
      $gshadow_default    = ['files']
      $hosts_default      = ['files','dns']
      $netgroup_default   = ['nis']
      $netmasks_default   = []
      $networks_default   = ['files']
      $passwd_default     = ['compat']
      $protocols_default  = ['db','files']
      $publickey_default  = []
      $rpc_default        = ['db','files']
      $services_default   = ['db','files']
      $shadow_default     = ['compat']
      $sudoers_default    = []
    }
    'SLES': {
      $aliases_default    = ['files']
      $automount_default  = ['files']
      $bootparams_default = ['files']
      $ethers_default     = ['files']
      $group_default      = ['compat']
      $gshadow_default    = []
      $hosts_default      = ['files','dns']
      $netgroup_default   = ['files']
      $netmasks_default   = ['files']
      $networks_default   = ['files','dns']
      $passwd_default     = ['compat']
      $protocols_default  = ['files']
      $publickey_default  = ['files']
      $rpc_default        = ['files']
      $services_default   = ['files']
      $shadow_default     = []
      $sudoers_default    = []
    }
    'Solaris': {
      $passwd_default       = ['files','nisplus']
      $group_default        = ['files','nisplus']
      $gshadow_default      = []
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
      $shadow_default       = []
      $sudoers_default      = []
    }
    'Gentoo': {
      $aliases_default    = ['files']
      $automount_default  = ['files']
      $bootparams_default = ['files']
      $ethers_default     = ['db','files']
      $group_default      = ['compat']
      $gshadow_default    = []
      $hosts_default      = ['files','dns']
      $netgroup_default   = ['files']
      $netmasks_default   = ['files']
      $networks_default   = ['files','dns']
      $passwd_default     = ['compat']
      $protocols_default  = ['db','files']
      $publickey_default  = []
      $rpc_default        = ['db','files']
      $services_default   = ['db','files']
      $shadow_default     = ['compat']
      $sudoers_default    = []
    }
    default: {
      fail("${::operatingsystem} is not a supported operating system.")
    }
  }
}
