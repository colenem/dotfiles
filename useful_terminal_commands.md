### **Useful terminal commands:**
* Show connected drives:  
    ```
    $ lsblk -o name,label,size,fstype,state,mountpoint
    ```  
    **OR**  
    ```
    $ sudo fdisk -l
    ```  
    **OR**  
    ```
    $ sudo parted -l
    ```
* Get size info on mounted drives:  
    ```
    $ df -H
    ```
* Get size info of a directory:  
    ```
    $ du -hs <DIR>
    ```  
    **OR** for full directory breakdown (long output though):  
    ```
    $ du -h <DIR>
    ``` 
* TAR a file without the pesky trailing forward slash and dot ("./files"):  
    ```
    $ find <Folder_Location> -printf "%P\n" | tar -cvf <tarFileName>.tar --no-recursion -C <Folder_Location> -T -
    ```
* Delete virtualbox rawdisk medium (cannot be attached to guest OS):  
    ```
    $ VBoxManage closemedium disk --delete <VMDK_UUID>
    ```
* Create virtualbox rawdisk to be used on quest machine using a hard drive partition (e.g., /dev/sda3):  
    ```
    $ VBoxManage internalcommands createrawvmdk -filename '<VM_LOCATION>/fileName.vmdk' -rawdisk /dev/sdX -partitions X -relative
    ```
* Boot from HDD partition or USB with qemu:  
    ```
    $ qemu-system-x86_64 -enable-kvm -m 1536 -hda /dev/sdX -cpu host,hv_relaxed,hv_spinlocks=0x1fff,hv_vapic,hv_time -smp cpus=2
    ```
* Boot an ISO file with qemu (include `-enable-kvm` for windows):  
    ```
    $ qemu-system-x86_64 -boot d -cdrom '<ISO_LOCATION>.iso' -m 2048
    ```
* Boot qemu with samba share enabled and mount specified host usb on windows guest
    ```
    $ xdg-su -c "qemu-system-x86_64 \
    -net nic \
    -net user,smb=<samba_share_dir> \
    -smp cpus=2 \
    -cpu host \
    -enable-kvm \
    -m 4096 \
    -drive format=qcow2,file=<vm_path>.qcow2 \
    -device qemu-xhci,id=xhci \
    -device usb-host,hostbus=6,hostaddr=4"
    ```
* Download and save file using wget:  
    ```
    $ wget -O <DWNLD_LOC>/fileName <FILE_URL>
    ```
* Just in case you break your internet (again):
    ```
    $ sudo systemctl status systemd-networkd
    $ sudo systemctl start systemd-networkd
    $ sudo systemctl enable systemd-networkd
    $ journalctl -b | grep networkd (check for issues)
    $ networkctl (choose between status || start || list)
    $ sudo lshw -C network
    $ sudo ifconfig <network-device> up
    $ sudo dhclient -v <network-device>
    ```
