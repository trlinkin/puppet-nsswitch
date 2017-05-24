require 'spec_helper'

describe 'nsswitch', :type => :class do
  %w{CentOS RedHat Amazon CloudLinux OracleLinux Scientific Fedora SLES Solaris Debian Ubuntu Gentoo}.each do |os|
    context "when used with default parameter on #{os}" do
      let(:facts) { {:operatingsystem => os } }
      it { is_expected.to compile.with_all_deps }
      it { is_expected.to have_resource_count(1) }
    end
  end

  context 'when used with default parameters on Enterprise Linux' do
    let(:facts) { {:operatingsystem => 'RedHat'} }

    context 'version 6' do
      let(:facts) do
        super().merge({:operatingsystemimajrelease => '6'})
      end
      it { is_expected.to compile.with_all_deps }
      it { is_expected.to have_resource_count(1) }
    end

    context 'version 7' do
      let(:facts) do
        super().merge({:operatingsystemmajrelease => '7'})
      end
      it { is_expected.to compile.with_all_deps }
      it { is_expected.to have_resource_count(1) }
    end
  end

  context 'when used on an unsupported Operating System' do
    let(:facts) { {:operatingsystem => 'Windows' } }
    it do
      is_expected.to raise_error(Puppet::Error, /is not a supported operating system\./)
    end
  end
end
