class nsswitch (
  $aliases    = $nsswitch::params::aliases,
  $automount  = $nsswitch::params::automount,
  $bootparams = $nsswitch::params::bootparams,
  $ethers     = $nsswitch::params::ethers,
  $group      = $nsswitch::params::group,
  $hosts      = $nsswitch::params::hosts,
  $netgroup   = $nsswitch::params::netgroup,
  $netmasks   = $nsswitch::params::netmasks,
  $network    = $nsswitch::params::network,
  $passwd     = $nsswitch::params::passwd,
  $protocols  = $nsswitch::params::protocols,
  $publickey  = $nsswitch::params::publickey,
  $rpc        = $nsswitch::params::rpc,
  $services   = $nsswitch::params::services,
  $shadow     = $nsswitch::params::shadow,
  $sudoers    = $nsswitch::params::sudoers,
) inherits nsswitch::params {

# We need to figure out if the use provided input or we use defaults.

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
