require 'spec_helper'
describe 'nsswitch', type: :class do
  on_supported_os.sort.each do |os, facts|
    # define os specific defaults
    case facts[:os]['name']
    when 'Archlinux'
      content_fixture = File.read(fixtures('testing/archlinux.txt'))
    when 'AlmaLinux', 'CentOS', 'RedHat', 'Rocky', 'Amazon', 'OEL', 'OracleLinux', 'Scientific', 'CloudLinux'
      content_fixture = case facts[:os]['release']['major']
                        when '6'
                          File.read(fixtures('testing/redhat-6.txt'))
                        else
                          File.read(fixtures('testing/redhat.txt'))
                        end
    when 'Debian', 'Ubuntu'
      content_fixture = File.read(fixtures('testing/debian.txt'))
    when 'Fedora'
      content_fixture = File.read(fixtures('testing/fedora.txt'))
    when 'FreeBSD'
      content_fixture = File.read(fixtures('testing/freebsd.txt'))
      group = 'wheel'
    when 'Gentoo'
      content_fixture = File.read(fixtures('testing/gentoo.txt'))
    when 'SLED', 'SLES'
      content_fixture = File.read(fixtures('testing/suse.txt'))
    when 'Solaris'
      content_fixture = File.read(fixtures('testing/solaris.txt'))
    end

    group = 'root' if group.nil?

    describe "on #{os} with default values for parameters" do
      let(:facts) { facts }

      it { is_expected.to contain_class('nsswitch') }
      it do
        is_expected.to contain_file('nsswitch.conf').only_with(
          'ensure'  => 'file',
          'path'    => '/etc/nsswitch.conf',
          'owner'   => 'root',
          'group'   => group,
          'mode'    => '0644',
          'content' => content_fixture,
        )
      end
    end
  end

  describe 'parameters on supported OS' do
    # tests should be OS independent, so we only test RedHat
    test_on = {
      supported_os: [
        {
          'operatingsystem'        => 'RedHat',
          'operatingsystemrelease' => ['8'],
        },
      ],
    }
    on_supported_os(test_on).sort.each do |_os, os_facts|
      let(:facts) { os_facts }

      ['aliases', 'automount', 'bootparams', 'ethers', 'group', 'gshadow', 'hosts', 'netgroup', 'netmasks',
       'networks', 'passwd', 'protocols', 'publickey', 'rpc', 'services', 'shadow', 'shells', 'sudoers'].each do |param|
        context "with #{param} set to valid string value" do
          let(:params) { { "#{param}": 'testing' } }

          it { is_expected.to contain_file('nsswitch.conf').with_content(%r{#{param}:\s*testing}) }
        end

        context "with #{param} set to valid array value" do
          let(:params) { { "#{param}": ['test', 'ing'] } }

          it { is_expected.to contain_file('nsswitch.conf').with_content(%r{#{param}:\s*test ing}) }
        end
      end

      context 'with file_group set to valid string value' do
        let(:params) { { file_group: 'testing' } }

        it { is_expected.to contain_file('nsswitch.conf').with_group('testing') }
      end

      context 'with file_owner set to valid string value' do
        let(:params) { { file_owner: 'testing' } }

        it { is_expected.to contain_file('nsswitch.conf').with_owner('testing') }
      end

      context 'with file_perms set to valid string value' do
        let(:params) { { file_perms: '0242' } }

        it { is_expected.to contain_file('nsswitch.conf').with_mode('0242') }
      end

      context 'with file_path set to valid Stdlib::Unixpath' do
        let(:params) { { file_path: '/test/ing' } }

        it { is_expected.to contain_file('nsswitch.conf').with_path('/test/ing') }
      end
    end
  end
end
