provider "aws" {
    region = "us-east-1"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "simple-ec2" {
  	ami 		= data.aws_ami.ubuntu.id
  	instance_type	= "t2.micro"
    tags = {
        Name = "Simple-ec2"
    }
      user_data     = <<EOT
#cloud-config
# update apt on boot
package_update: true
# install nginx
packages:
- nginx
write_files:
- content: |
    <!DOCTYPE html>
    <html>
    <head>
      <title>StackPath - Amazon Web Services Instance</title>
      <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
      <style>
        html, body {
          background: #000;
          height: 100%;
          width: 100%;
          padding: 0;
          margin: 0;
          display: flex;
          justify-content: center;
          align-items: center;
          flex-flow: column;
        }
        img { width: 250px; }
        svg { padding: 0 40px; }
        p {
          color: #fff;
          font-family: 'Courier New', Courier, monospace;
          text-align: center;
          padding: 10px 30px;
        }
      </style>
    </head>
    <body>
      <img src="https://www.stackpath.com/content/images/logo-and-branding/stackpath-logo-standard-screen.svg">
      <p>This request was proxied from <strong>Amazon Web Services</strong></p>
    </body>
    </html>
  path: /usr/share/app/index.html
  permissions: '0644'
runcmd:
- cp /usr/share/app/index.html /usr/share/nginx/html/index.html
EOT

}

resource "aws_eip" "ip" {
    instance = aws_instance.simple-ec2.id
}
