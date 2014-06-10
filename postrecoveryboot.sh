#!/sbin/sh
set -x
echo "postrecoveryboot.sh running"

echo "Mounting partitions"
mount /sdcard
mount /cache

echo "Creating directory"
mkdir -p /cache/recovery/
# Check if we have cwm/twrp scripts on the sdcard from a BML -> MTD flash

# Check CWM extendedcommand script
if busybox test -e /sdcard/extendedcommand; then
    echo "CWM extendedcommand found on sdcard, moving it to cache"
    cat /sdcard/extendedcommand > /cache/recovery/extendedcommand
    rm /sdcard/extendedcommand
fi

# Check TWRP OpenRecoveryScript
if busybox test -e /sdcard/openrecoveryscript; then
    echo "TWRP openrecoveryscript found on sdcard, moving it to cache"
    cat /sdcard/openrecoveryscript > /cache/recovery/openrecoveryscript
    rm /sdcard/openrecoveryscript
fi

echo "postrecoveryboot.sh finished"
exit 0
