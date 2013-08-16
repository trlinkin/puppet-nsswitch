# nsswitch.conf module for Puppet

A way of expressing nsswitch.conf configurations declaratively. This
should cover the 15 basic databases NSS supports. 

### Defaults

Currenly this module has support for RedHat, CentOS, Amazon Linux, and
Ubuntu. This module at its very basic will create an nsswitch.conf that
uses defaults derived from the distrobution provided nsswitch.conf file.
These defaults have been verified on the mentioned Distrobutions.

### Supported Systems
This module should be capable of supporting the following systems:
 * Debian/Ubuntu
 * RHEL (Centos, RHEL6.x, Amazon)
 * Fedora

Testing has only confirmed functionality on the following:
  * Centos 6.x
  * Ubuntu 12.4

### Usage

Example nsswitch.conf with all defaults for RHEL systems.
```
# This file is controlled by Puppet

passwd:     files
shadow:     files
group:      files
hosts:      files dns
bootparams: nisplus [NOTFOUND=return] files
ethers:     files
netmasks:   files
networks:   files
protocols:  files
rpc:        files
services:   files
netgroup:   nisplus
publickey:  nisplus
automount:  files nisplus
aliases:    files nisplus
```

## nsswitch class

This is the class by which you will manage the nsswitch.conf file. There
is one paramter per standard database NSS supports. The class accepts both strings 
and arrays as paramters. The benefit being, you could possibly merge an array
of options with hiera. When using an array, each element should be the
lookup service followed by the reaction statement.

Available parameters are:
```
passwd
group
shadow
hosts
bootparams
aliases
automount
ethers
netgroup
netmasks
network
protocols
publickey
rpc
services
```

For more information on NSS, please see the man pages. `man 5 nsswitch.conf`

## Examples

```
# defaults only
include nsswitch

# setting a simple lookup
class { 'nsswitch':
  publickey => 'nis',
}

# 'hosts' lookups contain a reaction statement for the 'dns' service
class { 'nsswitch':
  passwd => ['ldap','files'],
  hosts  => ['dns [!UNAVAIL=return]','files'],
}
```

