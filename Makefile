
all: main.s
	 riscv64-unknown-elf-as -mabi=ilp32 -march=rv32i main.s -o main.o
	 riscv64-unknown-elf-ld -m elf32lriscv main.o -o main.x

run: main.x
	 qemu-system-riscv64 -machine virt -m 2048 -smp 4 -bios /usr/lib/riscv64-linux-gnu/opensbi/generic/fw_jump.bin -kernel /usr/lib/u-boot/qemu-riscv64_smode/uboot.elf -device virtio-net-device,netdev=eth0 -netdev user,id=eth0 -device virtio-rng-pci -drive file=main.x,format=raw,if=virtio
