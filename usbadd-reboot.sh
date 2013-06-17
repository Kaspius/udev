#!/bin/sh
PATH=/bin:/usr/bin:/sbin:/usr/sbin:/root/bin
vendor_serial=$1 # The usb storage disk vendor infomation.
DEVNAME=$2 # The name in kernel, such as sdb, sdc...
DATE=$(/bin/date +%Y%m%d-%H:%M:%S)
msg() {
  /bin/echo "WARNING: The usb storage disk plug into system is detected by udev, the following lines are the details:"
  /bin/echo --------------------------------
  /bin/echo "Device: $DEVNAME in kernel"
  /bin/echo "Vendor: $vendor_serial"
  /bin/echo "Time: $DATE"
  /bin/echo '!!!REBOOT SYSTEM NOW!!!'
  /bin/echo --------------------------------
}
msg |tee /tmp/usbadd.msg |/bin/mail -s 'WARNING: USB DISK ADDED' root@localhost 
/bin/sleep 5 # waiting for send mail
/sbin/reboot
