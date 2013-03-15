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
) inherits nsswitch::params {

  file { $nsswitch::params::nsswitch_path:
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('nsswitch/nsswitch.conf.erb'),
  }
}
