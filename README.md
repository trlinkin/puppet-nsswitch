# nsswitch.conf module for Puppet

A way of expressing nsswitch.conf configurations declaratively. This
should manage the standard 15 databases NSS supports, plus the `sudo` entry
respected by sudo since the 1.7.0 release.

### Defaults

Currently this module has support for EL based Linux distributions,
Fedora, Ubuntu, and Gentoo. This module by default will create a basic
nsswitch.conf that uses defaults derived from what the distribution uses in
the nsswitch.conf file on fresh install. These defaults have been verified
on the mentioned distributions by the kindness and diligence of
contributors, of which I'm very grateful.

### Supported Systems
This module should be capable of supporting the following systems:
 * Debian/Ubuntu
 * RHEL (Centos, RHEL6.x, Amazon)
 * Fedora
 * Oracle Linux 6.x
 * Gentoo

Testing has only confirmed functionality on the following:
  * Ubuntu 12.4
  * Fedora 19

### Usage

#### nsswitch class

This is the class by which you will manage the nsswitch.conf file. There
is one paramter per standard database NSS supports. The class accepts both strings 
and arrays as paramters. The benefit being, you could possibly merge an array
of options with hiera. When using an array, each element should be the
lookup service followed by the reaction statement.

Available parameters are:

* passwd
* group
* shadow
* hosts
* bootparams
* aliases
* automount
* ethers
* netgroup
* netmasks
* network
* protocols
* publickey
* rpc
* services
* sudo


For more information on NSS, please see the man pages. `man 5 nsswitch.conf`

#### Examples

```Puppet
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
    
#### Example nsswitch.conf with all defaults for RHEL systems

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

#### License
   Copyright 2013 Thomas Linkin <tom@puppetlabs.com>

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.

