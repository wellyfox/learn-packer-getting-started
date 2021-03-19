variable "ami_name" {
  type    = string
  default = "my-custom-ami"
}

locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }

source "amazon-ebs" "example" {
  profile = "aws-devops"
  ami_name      = "${var.ami_name}-${local.timestamp}"
  instance_type = "t2.micro"
  region        = "ap-southeast-2"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
}


build {
  sources = ["source.amazon-ebs.example"]

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
