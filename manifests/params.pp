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

  $file_owner = 'root'
  $file_perms = '0644'

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

      $file_group         = 'root'

      $aliases_default    = ['files','nisplus']
      $bootparams_default = ['nisplus [NOTFOUND=return]','files']
      $ethers_default     = ['files']
      $gshadow_default    = undef
      $hosts_default      = ['files','dns']
      $netmasks_default   = ['files']
      $networks_default   = ['files']
      $protocols_default  = ['files']
      $publickey_default  = ['nisplus']
      $rpc_default        = ['files']
      $shells_default     = undef
      $sudoers_default    = undef
    }
    'Fedora': {
      $file_group         = 'root'

      $aliases_default    = ['files','nisplus']
      $automount_default  = ['files','nisplus']
      $bootparams_default = ['nisplus [NOTFOUND=return]','files']
      $ethers_default     = ['files']
      $group_default      = ['files']
      $gshadow_default    = undef
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
      $shells_default     = undef
      $sudoers_default    = undef
    }
    /Ubuntu|Debian/: {
      $file_group         = 'root'

      $aliases_default    = undef
      $automount_default  = undef
      $bootparams_default = undef
      $ethers_default     = ['db','files']
      $group_default      = ['compat']
      $gshadow_default    = ['files']
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
      $shells_default     = undef
      $sudoers_default    = undef
    }
    'SLES': {
      $file_group         = 'root'

      $aliases_default    = ['files']
      $automount_default  = ['files']
      $bootparams_default = ['files']
      $ethers_default     = ['files']
      $group_default      = ['compat']
      $gshadow_default    = undef
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
      $shells_default     = undef
      $sudoers_default    = undef
    }
    'Solaris': {
      $file_group         = 'root'

      $aliases_default    = ['files','nisplus']
      $automount_default  = ['files','nisplus']
      $bootparams_default = ['nisplus','files']
      $ethers_default     = ['nisplus','files']
      $group_default      = ['files','nisplus']
      $gshadow_default    = undef
      $hosts_default      = ['files','dns','nisplus']
      $netgroup_default   = ['nisplus']
      $netmasks_default   = ['files','nisplus']
      $networks_default   = ['nisplus','files']
      $passwd_default     = ['files','nisplus']
      $protocols_default  = ['nisplus','files']
      $publickey_default  = ['nisplus']
      $rpc_default        = ['nisplus','files']
      $services_default   = ['nisplus','files']
      $shadow_default     = undef
      $shells_default     = undef
      $sudoers_default    = undef
    }
    'Gentoo': {
      $file_group         = 'root'

      $aliases_default    = ['files']
      $automount_default  = ['files']
      $bootparams_default = ['files']
      $ethers_default     = ['db','files']
      $group_default      = ['compat']
      $gshadow_default    = undef
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
      $shells_default     = undef
      $sudoers_default    = undef
    }
    'FreeBSD': {
      $file_group         = 'wheel'

      $aliases_default    = undef
      $automount_default  = undef
      $bootparams_default = undef
      $ethers_default     = undef
      $group_default      = ['compat']
      $gshadow_default    = undef
      $hosts_default      = ['files','dns']
      $netgroup_default   = undef
      $netmasks_default   = undef
      $networks_default   = ['files']
      $passwd_default     = ['compat']
      $protocols_default  = ['files']
      $publickey_default  = undef
      $rpc_default        = ['files']
      $services_default   = ['compat']
      $shadow_default     = undef
      $shells_default     = ['files']
      $sudoers_default    = undef
    }
    default: {
      fail("${::operatingsystem} is not a supported operating system.")
    }
  }
}
