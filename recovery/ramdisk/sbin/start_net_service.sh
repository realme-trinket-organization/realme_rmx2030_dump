#!/sbin/sh

toybox chcon u:object_r:netd_exec:s0 /sbin/netd
chmod 755 /system/bin/ip6tables
chmod 755 /system/bin/iptables
chmod 755 /system/bin/netd
chmod 755 /system/bin/netutils-wrapper-1.0
chmod 755 /system/bin/sh
chmod 755 /system/bin/toybox
mount /dev/block/by-name/modem /vendor/firmware_mnt -o gid=1000,fmask=0337,dmask=0227,codepage=437,iocharset=iso8859-1,shortname=lower
mkdir -p /mnt/vendor/persist
mount /dev/block/bootdevice/by-name/persist /mnt/vendor/persist
cp /vendor/etc/wifi/WCNSS_qcom_cfg.ini /etc/firmware/wlan/qca_cld
cp /vendor/etc/wifi/WCNSS_qcom_cfg.ini /mnt/vendor/persist/WCNSS_qcom_cfg.ini
busybox chmod 0644 /etc/firmware/wlan/qca_cld/WCNSS_qcom_cfg.ini
busybox chmod 0644 /mnt/vendor/persist/WCNSS_qcom_cfg.ini
toybox start servicemanager
toybox start hwservicemanager
toybox start vndservicemanager
toybox start irsc_util
toybox start rmt_storage
toybox start vendor.qrtr-ns
toybox start tftp_server
toybox start per_mgr
toybox start pd_mapper
toybox start per_proxy
toybox start cnss-daemon
echo 1 > /dev/ipa
sleep 1
/sbin/insmod /sbin/qca_cld3_wlan.ko
toybox start netd
sleep 1
mkdir -p /data/misc/wifi/sockets
busybox chown 1010:1010 /data/misc/wifi/sockets
busybox chmod 0770 /data/misc/wifi/sockets
toybox chcon u:object_r:wpa_socket:s0 /data/misc/wifi/sockets
touch /data/misc/wifi/wpa_supplicant.conf
busybox chown 1010:1010 /data/misc/wifi/wpa_supplicant.conf
busybox chmod 0770 /data/misc/wifi/wpa_supplicant.conf
toybox start wpa_supplicant
