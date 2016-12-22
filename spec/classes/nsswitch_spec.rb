require 'spec_helper'

describe 'nsswitch' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end
        let(:expected) { File.read("spec/expected/#{os}_nsswitch.conf") }

        if facts[:os][:name] == 'Ubuntu'
          next
        end
        it { is_expected.to compile.with_all_deps }
        it { is_expected.to have_resource_count(1) }
        it { is_expected.to create_file('/etc/nsswitch.conf').with_content(expected) }
      end
    end
  end
end
