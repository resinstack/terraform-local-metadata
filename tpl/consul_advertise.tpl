client_addr = "127.0.0.1 {{ GetPrivateInterfaces | join \"address\" \" \" }}"
advertise_addr = "${consul_advertise}"
