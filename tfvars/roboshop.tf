resource "aws_instance" "web" {
  for_each = var.instance_name
  ami           = data.aws_ami.centos8.id
  instance_type = each.value
#   vpc_security_group_ids = [aws_security_group.roboshop-all.id]

  tags = {
    Name = each.key
  }
}

# resource "aws_route53_record" "www" {
#     count = 11
#     zone_id = var.zone_id
#     name = "${var.instance_name[count.index]}.devaws14.online"
#     type = "A"
#     ttl = 300
#     records = [var.instance_name[count.index] == "web" ? aws_instance.web[count.index].public_ip : aws_instance.web[count.index].private_ip]
# }

resource "aws_route53_record" "www" {
    for_each = aws_instance.web
    zone_id = var.zone_id
    name = "${each.key}.devaws14.online"
    type = "A"
    ttl = 1
    records = [startswith(each.key, "web") ? each.value.public_ip : each.value.private_ip]
}

# output "instances_info" {
#     value = aws_instance.web
# }