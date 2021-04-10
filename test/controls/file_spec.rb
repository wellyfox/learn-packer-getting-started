control 'welcome file is installed' do
  impact 0.6
  describe bash("cat /home/ubuntu/welcome.txt") do
    its('exit_status') {should eq 0}
    its('stdout') {should match('WELCOME TO PACKER!')}
  end
end
