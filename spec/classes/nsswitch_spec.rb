require 'spec_helper'

describe 'nsswitch', :type => :class do
  %w{CentOS RedHat Amazon OracleLinux Scientific Fedora SLES Solaris Debian Ubuntu Gentoo CloudLinux}.each do |os|
    context "when used with default parameter on #{os}" do
      let(:facts) { {:operatingsystem => os } }
      it { is_expected.to compile.with_all_deps }
      it { is_expected.to have_resource_count(1) }
    end
  end

  context 'when used on an unsupported Operatin System' do
    let(:facts) { {:operatingsystem => 'Windows' } }
    it do
      is_expected.to raise_error(Puppet::Error, /is not a supported operating system\./)
    end
  end
end
