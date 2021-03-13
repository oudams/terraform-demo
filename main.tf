variable "server_port" {
  description = "The port the server will use for HTTP requests"
  default     = 8080
  type        = number
}

output "public_id" {
  description = "The public IP address"
  value       = aws_instance.example_instance.public_ip
}

provider "aws" {
  region = "ap-southeast-1" //  To deploy the infra structure into the ap-sout.. regoin
}

resource "aws_instance" "example_instance" {
  ami           = "ami-01581ffba3821cdf3"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-example"
  }
  vpc_security_group_ids = [aws_security_group.instance.id]
  // init directive
  user_data = <<-EOT
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOT
}


// security group
resource "aws_security_group" "instance" {
  name = "terraform-example-instance"

  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

// > terraform init // to download provider code
// > terraform plan // see if any change for your infra, execution plan has been generated

resource "aws_launch_configuration" "example" {
  image_id        = "ami-01581ffba3821cdf3"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.instance.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p ${var.server_port} &
              EOF
  lifecycle {
    create_before_destroy = true
  }
}

// specifying ips
// find default vpc data source

// Direct Terraform to look for "Default" VPC in the aws account
data "aws_vpc" "default" {
  default = true
}

/* look for Subnets within the VPC*/
data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}

/* 'vpc_zone_identifier' Tells ASG to use the provided 'subnets'*/
resource "aws_autoscaling_group" "default" {
  max_size             = 3
  min_size             = 2
  launch_configuration = aws_launch_configuration.example.id
  vpc_zone_identifier  = data.aws_subnet_ids.default.ids
  target_group_arns = [aws_alb_target_group.asg.arn]
  health_check_type = "ELB"

  tag {
    key                 = "Name"
    value               = "terraform-asg-example"
    propagate_at_launch = true
  }
}
resource "aws_lb" "example_alb" {
  name = "terraform-alb-example"
  load_balancer_type = "application"
  subnets = data.aws_subnet_ids.default.ids
  security_groups = [aws_security_group.alb.id]
}
resource "aws_alb_listener" "http_alb_listener" {
  load_balancer_arn = aws_lb.example_alb.arn
  port = 80
  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "404: page not found"
      status_code = 404
    }
  }
}

resource "aws_security_group" "alb" {
  name = "terraform-example-alb"

  ingress {
    protocol = "tcp"
    from_port = 80
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_alb_target_group" "asg" {
  name = "terraform-asg-example"
  port = var.server_port
  protocol = "HTTP"
  vpc_id = data.aws_vpc.default.id
  health_check {
    path    ="/"
    protocol = "HTTP"
    matcher = "200"
    interval = 15
    timeout = 3
    healthy_threshold = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener_rule" "asg" {
  listener_arn = ""

  condition {
    path_pattern {
      values = ["*"]
    }
  }
  action {
    type = "forward"
    target_group_arn = aws_alb_target_group.asg.arn
  }
  condition {}
}

output "alb_dns_name" {
  value = aws_lb.example_alb.dns_name
  description = "The domain name of the load balancer"
}