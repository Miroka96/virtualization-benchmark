.PHONY:	run ifup ifdown unprivrun shutdown

USER := $(shell whoami)
#OPTIONS="-vnc :1"
QEMURUN = qemu-system-x86_64 -smp $(shell nproc) -hda ../qemu/myDebian.qcow2 -m 2048 -net nic -enable-kvm $(OPTIONS)

run:
	sudo $(QEMURUN) -net tap

ifup:
	sudo ip tuntap add dev tap0 mode tap user $(USER)
	sudo ip link set tap0 up
	sudo /etc/qemu-ifup tap0

ifdown:
	sudo /etc/qemu-ifdown tap0
	sudo ip link set tap0 down
	sudo ip tuntap del dev tap0 mode tap

unprivrun:
	$(QEMURUN) -net tap,ifname=tap0,script=no,downscript=no

shutdown:
	-./run-command.sh shutdown now
