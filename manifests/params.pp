class nsswitch::params {

  # Just incase anything Non-standard ever goes down
  $nsswitch_path = '/etc/nsswitch.conf'

  # default aliases for RedHat 6.x Families
  $_aliases = $aliases ? {
    true    => $aliases,
    default => [ 'files', 'nisplus' ],
  }

  $_automount = $automount ? {
    true    => $automount,
    default => ['files','nisplus'],
  }

  $_bootparams = $bootparams ? {
    true    => $bootparams,
    default => ['nisplus [NOTFOUND=return] files'],
  }

  $_ethers = $ethers ? {
    true    => $ethers,
    default => ['files'],
  }

  $_group = $group ? {
    true    => $group,
    default => ['files'],
  }

  $_hosts = $hosts ? {
    true    => $hosts,
    default => ['files','dns'],
  }

  $_netgroup = $netgroup ? {
    true    => $netgroup,
    default => ['nisplus'],
  }

  $_netmasks = $netmasks ? {
    true    => $netmasks,
    default => ['files'],
  }

  $_networks = $networks ? {
    true    => $networks,
    default => ['files'],
  }

  $_passwd = $passwd ? {
    true    => $passwd,
    default => ['files'],
  }

  $_protocols = $protocols ? {
    true    => $protocols,
    default => ['files'],
  }

  $_publickey = $publickey ? {
    true    => $publickey,
    default => ['nisplus'],
  }

  $_rpc = $rpc ? {
    true    => $rpc,
    default => ['files'],
  }

  $_services = $services ? {
    true    => $services,
    default => ['files'],
  }

  $_shadow = $shadow ? {
    true    => $shadow,
    default => ['files'],
  }
}
