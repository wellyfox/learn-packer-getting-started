control 'welcome file is installed' do
  describe bash("cat /home/ubuntu/welcome.txt") do
    its('exit_status') {should eq 0}
    its('stdout') {should match('WELCOME TO PACKER!')}
  end
end
