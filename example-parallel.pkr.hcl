variable "ami_name" {
  type = string
  # This example demostrates that you can load variables from the environment.
  # In real usage, the AWS sdk used by the Amazon builder can automatically
  # load credentials from the environment, so you wouldn't need to do this
  # step. See the Packer AWS docs for more details.
  default = "${env("CUSTOM_AMI_NAME")}"
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "do_api_token" {
  type    = string
  default = "your token here"
}

# source blocks are generated from your builders; a source can be referenced in
# build blocks. A build block runs provisioners and post-processors on a
# source.
source "amazon-ebs" "parallel-AWS" {
  ami_name      = "packer-linux-aws-demo"
  instance_type = "t2.micro"
  region        = "${var.region}"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-xenial-16.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
}

source "digitalocean" "parallel-DO" {
  api_token    = "${var.do_api_token}"
  image        = "ubuntu-20-04-x64"
  region       = "nyc3"
  size         = "512mb"
  ssh_username = "root"
}

# a build block invokes sources and runs provisioning steps on them.
build {
  sources = ["source.amazon-ebs.autogenerated_1"]

  provisioner "file" {
    destination = "/home/ubuntu/"
    source      = "./welcome.txt"
  }
  provisioner "shell" {
    inline = ["ls -al /home/ubuntu", "cat /home/ubuntu/welcome.txt"]
  }
  provisioner "shell" {
    script = "./example.sh"
  }
}