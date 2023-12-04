terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">= 4.64.0"
    }
  }
}


# fingerprint      = "af:7f:bb:78:6c:11:86:ac:d7:9e:71:ad:fa:41:22:8f"
# private_key_path = "~/.oci/terraform-oracle-cloud.pem"
# user_ocid        = "ocid1.user.oc1..aaaaaaaaeubxkxhij47zow2xcbqhkounmrx4iesli36yv52z2ml7ptmtjh2a"
# tenancy_ocid     = "ocid1.tenancy.oc1..aaaaaaaa2grbtpklpmfgeuihdqu44odpg7gc3svtgoklzbojeb4fct3yoamq"
# compartment_ocid = "ocid1.tenancy.oc1..aaaaaaaa2grbtpklpmfgeuihdqu44odpg7gc3svtgoklzbojeb4fct3yoamq"

# variable "tenancy_ocid" {}
variable "user_ocid" {
  default = "ocid1.user.oc1..aaaaaaaaeubxkxhij47zow2xcbqhkounmrx4iesli36yv52z2ml7ptmtjh2a"
}
variable "fingerprint" {
  default = "af:7f:bb:78:6c:11:86:ac:d7:9e:71:ad:fa:41:22:8f"
}
variable "private_key_path" {
  default = "/Users/ramunas/.oci/terraform-oracle-cloud.pem"
}

provider "oci" {
  tenancy_ocid     = var.compartment_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
}