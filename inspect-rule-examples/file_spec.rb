control "cis-1-2-2" do
  impact 1.0
  title "Verify DNS configuration"
  desc "verify is dns config file exists"
  describe file('/etc/resolv.conf') do
    its('content') { should match /nameserver/ }
  end
end
