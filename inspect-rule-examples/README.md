# How to run tests?
- inspec exec hello_spec.rb
- inspec exec cmd_spec.rb
- inspec exec file_spec.rb
- inspec init profile inspect-demo  --overwrite
- inspec check inspect-demo
- inspec exec inspect-demo
- inspec exec inspect-demo -t ssh://ec2-user@3.25.211.125 -i aws-devops.pem
