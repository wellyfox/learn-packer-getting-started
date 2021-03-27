# learn-packer-getting-started
Code for the Packer build tutorial at https://learn.hashicorp.com/packer

# Steps on MaC
- brew tap hashicorp/tap
- brew install hashicorp/tap/packer
- brew install chef/chef/inspec
- packer validate example.pkr.hcl 
- packer build example.pkr.hcl 

# Audit AWS resources
- inspec detect -t aws://ap-southeast-2/aws-devops

# References
- https://docs.chef.io/inspec/profiles/
- https://community.chef.io/tools/chef-inspec/
