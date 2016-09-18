require 'spec_helper'

describe package('ntp') do
  it { should be_installed }
end

describe file('/etc/ntp.conf') do
  it { should be_file }
  it { should be_mode 644 }
  it { should be_owned_by 'root' }
end

if os[:family] == 'ubuntu'
  describe service('ntp') do
    it { should be_running }
  end
end

if os[:family] == 'redhat'
  describe service('ntpd') do
    it { should be_running }
  end
end
