############################################
# KeyPair Creation                         #
############################################


resource "aws_key_pair" "redmi_auth" {

  key_name   = "${var.project_name}-${var.project_env}"
  public_key = file("redmi_key.pub")
  tags = {
    "Name" = "${var.project_name}-${var.project_env}"
  }
}

############################################
# zomato Security group                    #
############################################


resource "aws_security_group" "redmi_security_group" {
  name        = "${var.project_name}-${var.project_env}-frontend"
  description = "${var.project_name}-${var.project_env}-frontend"

  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    "Name" = "${var.project_name}-${var.project_env}-frontend"
  }
}


