This Project is the homework for our "Methods of Cloud Computing" lecture.

This Repo consists of two projects / tasks.

# virtualization-benchmark (/)

The aim is to run benchmarks on different (virtualized) platforms.
- native Linux
- Docker
- hardware-assisted VM (QEMU with KVM enabled)
- binary-translated VM (plain QEMU)

Benchmark Types:
- CPU (using Linpack)
- Memory (using Memsweep)
- random disk access (using FIO)
- Syscalls (using a forking script)
- Webserver performance (using NGINX and a download script running on the host)

# MY Container Tool (MYCT) (myct/)

run processes in their own namespaces and enable Docker-like features
- encapsulated execution
- mounting of directories
- execution within other processes namespaces
- memory and CPU limits

Warning: This script is only for educational purposes, because it is probably possible to escape the Chroot environment (Google for 'escaping Chroot Jail')
