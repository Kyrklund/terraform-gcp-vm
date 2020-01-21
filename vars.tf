#Define variables

#Optional variables, with defaults
variable "region"{
    default = "europe-north1"
}
variable "zone"{
    default = "a"
}
variable "instances"{
    default = 1
}
variable "vm_name"{
    default = "gcp-vm"
}
variable "vm_size"{
    default = "f1-micro"
}
variable "vm_image"{
    default = "debian-cloud/debian-9"
}
variable "network"{
    default = "default"
}
variable "startup_script"{
    default = ""
    #file("./startup.sh")
}

#Non-optional variables
variable "project"{
    description= "GCP project name"
}

variable "ssh_keys"{
    #["{user}:${file({ssh-key.pub})}", "{user}:${file({ssh-key.pub})}"]
}

variable "whitelist_ip"{
}