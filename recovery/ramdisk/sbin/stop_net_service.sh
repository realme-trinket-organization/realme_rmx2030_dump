#!/sbin/sh

toybox stop wpa_supplicant
toybox stop netd
/sbin/rmmod /sbin/qca_cld3_wlan.ko
toybox stop cnss-daemon
toybox stop per_proxy
toybox stop pd_mapper
toybox stop per_mgr
toybox stop tftp_server
toybox stop rmt_storage
toybox stop vendor.qrtr-ns
toybox stop irsc_util
toybox stop vndservicemanager
toybox stop servicemanager
umount /mnt/vendor/persist
umount /vendor/firmware_mnt
rm /tmp/aplist.txt
