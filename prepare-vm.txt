Script started on 2018-12-17 11:43:42+0100

# copy preparation script into the hosts web directory
]0;meth@tiger: ~/virtualization-benchmark[01;32mmeth@tiger[00m:[01;34m~/virtualization-benchmark[00m$ sudo cp prepare.sh /var/www/html/

# get the host IP
]0;meth@tiger: ~/virtualization-benchmark[01;32mmeth@tiger[00m:[01;34m~/virtualization-benchmark[00m$ ifconfig br0
br0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.1.11  netmask 255.255.255.0  broadcast 192.168.1.255
        inet6 fe80::18f2:1cff:fe27:1e6c  prefixlen 64  scopeid 0x20<link>
        ether 1a:f2:1c:27:1e:6c  txqueuelen 1000  (Ethernet)
        RX packets 141359  bytes 142963543 (142.9 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 94556  bytes 11147808 (11.1 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

]0;meth@tiger: ~/virtualization-benchmark[01;32mmeth@tiger[00m:[01;34m~/virtualization-benchmark[00m$ exit

Script done on 2018-12-17 11:44:03+0100

# on the host VM:
root@remote: wget 192.168.1.11/prepare.sh
root@remote: chmod +x prepare.sh
root@remote: ./prepare.sh
