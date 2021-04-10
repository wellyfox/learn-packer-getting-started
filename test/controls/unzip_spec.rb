control "unzip" do
  impact 0.8
  describe command('unzip -hh') do
    its(:exit_status) { is_expected.to eq 0 }
  end
end
