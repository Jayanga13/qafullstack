provider "aws" {
 region = "us-east-2"
}

resource "aws_instance" "JayangaW" {
  ami = "ami-0782e9ee97725263d"
  instance_type = "t2.micro"
  key_name = "fullstackkey"
  subnet_id = "subnet-04adf818d05d0928f"
  associate_public_ip_address = true
  vpc_security_group_ids = ["sg-04c7ac1c35820a26c"]
  user_data = "${file("install.sh")}"

 tags {
 Name = "JayangaW"
}

}
#####
output "instance_ips"
   {
     value = ["${aws_instance.JayangaW.*.public_ip}"]
    }
