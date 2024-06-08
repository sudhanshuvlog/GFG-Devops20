variable instance_type{
    type = string
    default = "t2.micro"
}

variable KeyName{
    type = string
    default = "devopsnew20"
}

variable sgName{
    default = "mygfgSg"
}

variable tagName{
    default = "TerraformEc2"
}

variable "availability_zone"{
    default = "ap-south-1a"
}

variable "sg_allowed_port"{
    type = list
    default = [80,8080,9090,81,82,3000]
}