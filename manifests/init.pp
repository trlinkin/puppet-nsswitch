class nsswitch (
  $aliases    = $nsswitch::params::aliases_default,
  $automount  = $nsswitch::params::automount_default,
  $bootparams = $nsswitch::params::bootparams_default,
  $ethers     = $nsswitch::params::ethers_default,
  $group      = $nsswitch::params::group_default,
  $hosts      = $nsswitch::params::hosts_default,
  $netgroup   = $nsswitch::params::netgroup_default,
  $netmasks   = $nsswitch::params::netmasks_default,
  $network    = $nsswitch::params::network_default,
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
