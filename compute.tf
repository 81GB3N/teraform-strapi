resource "oci_core_instance" "strapi_instance" {
  display_name = "strapi-ramuno"

  metadata = {
    ssh_authorized_keys = join("", local.pub_keys_content)
    user_data           = data.cloudinit_config.ubuntu_init.rendered
  }

  agent_config {
    is_management_disabled = "false"
    is_monitoring_disabled = "false"

    plugins_config {
      desired_state = "DISABLED"
      name          = "Management Agent"
    }

    plugins_config {
      desired_state = "ENABLED"
      name          = "Custom Logs Monitoring"
    }

    plugins_config {
      desired_state = "DISABLED"
      name          = "Compute RDMA GPU Monitoring"
    }

    plugins_config {
      desired_state = "ENABLED"
      name          = "Compute Instance Monitoring"
    }

    plugins_config {
      desired_state = "DISABLED"
      name          = "Compute HPC RDMA Auto-Configuration"
    }

    plugins_config {
      desired_state = "DISABLED"
      name          = "Compute HPC RDMA Authentication"
    }

    plugins_config {
      desired_state = "DISABLED"
      name          = "Bastion"
    }

  }

  availability_config {
    recovery_action = "RESTORE_INSTANCE"
  }

  availability_domain = var.availability_domain
  compartment_id      = var.compartment_ocid
  fault_domain        = var.default_fault_domain

  create_vnic_details {
    assign_private_dns_record = false
    assign_public_ip          = true
    subnet_id                 = var.public_subnet_id
  }

  instance_options {
    are_legacy_imds_endpoints_disabled = false
  }

  shape = var.shape
  shape_config {
    memory_in_gbs = var.memory_in_gbs
    ocpus         = var.ocpus
  }

  source_details {
    source_id   = var.os_image_id
    source_type = "image"
  }

  freeform_tags = local.tags
}