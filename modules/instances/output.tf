output "public_ip_id" {
  value = "${aws_instance.Server.public_ip}"
}

output "network_interface_id" {
  value = "${aws_instance.Server.primary_network_interface_id}"
}
