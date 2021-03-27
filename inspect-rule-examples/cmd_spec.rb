control "cis-1-2-1" do                      
  impact 1.0                                
  title "uname command"
  desc "this is to verify is uname command existing in the Mac machine"
  describe command('uname -a') do
   its('stdout') { should match /Darwin/ }
  end
end
