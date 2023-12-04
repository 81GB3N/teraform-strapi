variable "compartment_ocid" {
  default = "ocid1.tenancy.oc1..aaaaaaaa2grbtpklpmfgeuihdqu44odpg7gc3svtgoklzbojeb4fct3yoamq"
}

variable "region" {
  default = "eu-frankfurt-1"
}

variable "availability_domain" {
  default = "egEE:EU-FRANKFURT-1-AD-1"
}

# variable "PATH_TO_PUBLIC_KEY" {
#   type = string
#   # default     = "~/.ssh/id_rsa.pub"
#   default     = "/Users/ramunas/.oci/terraform-oracle-cloud_public.pem"
#   description = "Path to your public key"
# }

variable "environment" {
  type    = string
  default = "development"
}

variable "is_private" {
  type    = bool
  default = true
}

variable "public_subnet_id" {
  type    = string
  default = "ocid1.subnet.oc1.eu-frankfurt-1.aaaaaaaamraivkdawacfycvjic57q2qspc7btt2aabfe7tlyq5qdgojlldta"
}

variable "private_subnet_id" {
  type    = string
  default = "subnet-20231121-1320"
}

variable "default_fault_domain" {
  default = "FAULT-DOMAIN-1"
}

variable "os_image_id" {
  default = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaaltfitzfkiurvghfhzsqlei7mcnrphedsre3qunnoeusstcv2vm4q" # Canonical-Ubuntu-22.04-aarch64-2023.07.20-0
}

variable "shape" {
  default = "VM.Standard.E3.Flex"
}

variable "memory_in_gbs" {
  default = "2"
}

variable "ocpus" {
  default = "1"
}

locals {
  tags = {
    "environment" = "production"
    "purpose"     = "strapi"
  }

  pub_keys_content = [
    for file_name in fileset("${path.module}/pub_keys", "*") : file("${path.module}/pub_keys/${file_name}")
  ]

  # ssh_authorized_keys_content = join("", local.pub_keys_content)

}
