class nsswitch (
  $aliases    = undef,
  $automount  = undef,
  $bootparams = undef,
  $ethers     = undef,
  $group      = undef,
  $hosts      = undef,
  $netgroup   = undef,
  $netmasks   = undef,
  $network    = undef,
  $passwd     = undef,
  $protocols  = undef,
  $publickey  = undef,
  $rpc        = undef,
  $services   = undef,
  $shadow     = undef,
  $sudoers    = undef,
) inherits nsswitch::params {

# We need to figure out if the use provided input or we use defaults.

  # Determine the value for Aliases
  if $aliases {
    validate_multi($aliases,'string','array')
    $_aliases = $aliases
  }else{
    $_aliases = $nsswitch::params::aliases_default
  }
  # Determine the value for Auto Mounting
  if $automount {
    validate_multi($automount,'string','array')
    $_automount = $automount
  }else{
    $_automount= $nsswitch::params::automount_default
  }
  # Determine the value for Boot Params
  if $bootparams {
    validate_multi($bootparams,'string','array')
    $_bootparams = $bootparams
  }else{
    $_bootparams = $nsswitch::params::bootparams_default
  }
  # Determine the value for Ethers
  if $ethers {
    validate_multi($ethers,'string','array')
    $_ethers = $ethers
  }else{
    $_ethers = $nsswitch::params::ethers_default
  }
  # Determine the value for Groups
  if $group {
    validate_multi($group,'string','array')
    $_group = $group
  }else{
    $_group = $nsswitch::params::group_default
  }
  # Determine the value for Hosts
  if $hosts {
    validate_multi($hosts,'string','array')
    $_hosts = $hosts
  }else{
    $_hosts = $nsswitch::params::hosts_default
  }
  # Determine the value for Netgroup
  if $netgroup {
    validate_multi($netgroup,'string','array')
    $_netgroup = $netgroup
  }else{
    $_netgroup = $nsswitch::params::netgroup_default
  }
  # Determine the value for Netmasks
  if $netmasks {
    validate_multi($netmasks,'string','array')
    $_netmasks = $netmasks
  }else{
    $_netmasks = $nsswitch::params::netmasks_default
  }
  # Determine the value for Networks
  if $networks {
    validate_multi($networks,'string','array')
    $_networks = $networks
  }else{
    $_networks = $nsswitch::params::networks_default
  }
  # Determine the value for PASSWD
  if $passwd  {
    validate_multi($passwd,'string','array')
    $_passwd = $passwd
  }else{
    $_passwd = $nsswitch::params::passwd_default
  }
  # Determine the value for Protocols
  if $protocols {
    validate_multi($protocols,'string','array')
    $_protocols = $protocols
  }else{
    $_protocols = $nsswitch::params::protocols_default
  }
  # Determine the value for Public Key
  if $publickey {
    validate_multi($publickey,'string','array')
    $_publickey = $publickey
  }else{
    $_publickey = $nsswitch::params::publickey_default
  }
  # Determine the value for RPC
  if $rpc {
    validate_multi($rpc,'string','array')
    $_rpc = $rpc
  }else{
    $_rpc = $nsswitch::params::rpc_default
  }
  # Determine the value for Services
  if $services {
    validate_multi($services,'string','array')
    $_services = $services
  }else{
    $_services = $nsswitch::params::services_default
  }
  # Determine the value for Shadow
  if $shadow {
    validate_multi($shadow,'string','array')
    $_shadow = $shadow
  }else{
    $_shadow = $nsswitch::params::shadow_default
  }
  # Determine the value for Sudoers
  if $sudoers {
    validate_multi($sudoers,'string','array')
    $_sudoers = $sudoers
  }else{
    $_sudoers = $nsswitch::params::sudoers_default
  }

  file { $nsswitch::params::nsswitch_path:
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('nsswitch/nsswitch.conf.erb'),
  }
}
