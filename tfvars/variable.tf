
variable "instance_name" {
    type = map
    default = {
        mongodb = "t3.small"
        redis = "t3.small"
        mysql = "t3.small"
        web = "t2.micro"
        # rabbitmq = "t2.micro"
        # catalogue = "t2.micro"
        # cart = "t2.micro"
        # user = "t2.micro"
        # shipping = "t2.micro"
        # payment = "t2.micro"
        
    }

}


variable "zone_id" {
    default = "Z01153362SHO2OMAXBVRO"
    type = string
  
}

