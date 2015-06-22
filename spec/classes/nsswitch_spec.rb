require 'spec_helper'

describe 'nsswitch', :type => :class do
  %w{CentOS RedHat Amazon OracleLinux Scientific Fedora SLES Solaris Debian Ubuntu Gentoo}.each do |os|
    context "when used with default parameter on #{os}" do
      let(:facts) { {:operatingsystem => os } }
      it { should compile.with_all_deps }
      it { should have_resource_count(1) }
    end
  end

  context 'when used on an unsupported Operatin System' do
    let(:facts) { {:operatingsystem => 'Windows' } }
    it do
      expect raise_error(Puppet::Error, /is not a supported operating system\./)
    end
  end
end
