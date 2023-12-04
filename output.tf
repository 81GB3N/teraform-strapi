output "instance_public_ip" {
  value = oci_core_instance.strapi_instance.public_ip
}