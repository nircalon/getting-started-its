terraform {
  required_providers {
    infoblox = {
      source = "infobloxopen/infoblox"
      version = "1.1.1"
    }
  }
}

provider "infoblox"{
    username = "admin"
    password = "P@ssw0rd"
    server = "10.7.1.22"
}

resource "infoblox_a_record" "demo_record"{
  vm_name=var.vsphere_vm_name
  cidr="10.7.1.0/24"
  ip_addr=var.ip_addr
  zone="ad.vzure.com"
tenant_id="test"
}

resource "infoblox_ip_allocation" "demo_allocation"{
  vm_name="terraform-demo1"
  cidr="10.7.1.0/24"
  ip_addr = var.ip_addr
  tenant_id="test"
}

output "instance_ip_Addr" {
  value = var.ip_addr
}
