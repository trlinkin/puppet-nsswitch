source ENV['GEM_SOURCE'] || "https://rubygems.org"

gem 'rspec-core', '3.3.0',     :require => false
gem 'rspec-puppet', '2.2.0',   :require => false
gem 'rake', '< 11.0',          :require => false
gem 'puppetlabs_spec_helper',  :require => false
gem 'puppet-lint',             :require => false
gem 'metadata-json-lint',      :require => false

if facterversion = ENV['FACTER_GEM_VERSION']
  gem 'facter', facterversion, :require => false
else
  gem 'facter', :require => false
end

if puppetversion = ENV['PUPPET_GEM_VERSION']
  gem 'puppet', puppetversion, :require => false
else
  gem 'puppet', :require => false
end
