require 'spec_helper'

describe package('httpd') do
  it { should be_installed }
end

describe service('httpd') do
  it { should be_enabled }
  it { should be_running }
end

%w(80 443).each do |port_number|
  describe port(port_number.to_i) do
    it { should be_listening }
  end
end
