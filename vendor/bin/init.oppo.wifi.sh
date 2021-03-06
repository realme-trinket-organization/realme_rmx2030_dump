#! /vendor/bin/sh

# Copyright (c) 2010-2013, The Linux Foundation. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above
#       copyright notice, this list of conditions and the following
#       disclaimer in the documentation and/or other materials provided
#       with the distribution.
#     * Neither the name of The Linux Foundation nor the names of its
#       contributors may be used to endorse or promote products derived
#       from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
# WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
# ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
# BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
# IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# This script will load and unload the wifi driver to put the wifi in
# in deep sleep mode so that there won't be voltage leakage.
# Loading/Unloading the driver only incase if the Wifi GUI is not going
# to Turn ON the Wifi. In the Script if the wlan driver status is
# ok(GUI loaded the driver) or loading(GUI is loading the driver) then
# the script won't do anything. Otherwise (GUI is not going to Turn On
# the Wifi) the script will load/unload the driver
# This script will get called after post bootup.

target="$1"
serialno="$2"

btsoc=""
#ifdef VENDOR_EDIT
#qiulei@PSW.CN.Wifi.Hardware, 2018/06/18,
#Add for make bin Rom-update.
if [ -s /vendor/etc/wifi/bin_version ]; then
    system_version=`cat /vendor/etc/wifi/bin_version`
else
    system_version=1
fi

if [ -s /mnt/vendor/persist/bin_version ]; then
    persist_version=`cat /mnt/vendor/persist/bin_version`
else
    persist_version=1
fi

if [ ! -s /mnt/vendor/persist/bdwlan.bin  -o $system_version -gt $persist_version ]; then
    prj_version=`cat /proc/oppoVersion/prjVersion`
    case $prj_version in
       "19021")
        cp /vendor/etc/wifi/bdwlan_19021_id1.bin /mnt/vendor/persist/bdwlan_19021_id1.bin
        ;;
        "19022")
        cp /vendor/etc/wifi/bdwlan_19022_id1.bin /mnt/vendor/persist/bdwlan_19022_id1.bin
        ;;
        "19026")
        cp /vendor/etc/wifi/bdwlan_19026_id1.bin /mnt/vendor/persist/bdwlan_19026_id1.bin
        ;;
        "19027")
        cp /vendor/etc/wifi/bdwlan_19027_id1.bin /mnt/vendor/persist/bdwlan_19027_id1.bin
        ;;
        "19023")
        cp /vendor/etc/wifi/bdwlan_19023_id1.bin /mnt/vendor/persist/bdwlan_19023_id1.bin
        ;;
        "19025")
        cp /vendor/etc/wifi/bdwlan_19025_id1.bin /mnt/vendor/persist/bdwlan_19025_id1.bin
        ;;
        "19321")
        cp /vendor/etc/wifi/bdwlan_19321_id1.bin /mnt/vendor/persist/bdwlan_19321_id1.bin
        ;;
        "19322")
        cp /vendor/etc/wifi/bdwlan_19322_id1.bin /mnt/vendor/persist/bdwlan_19322_id1.bin
        ;;
        "19323")
        cp /vendor/etc/wifi/bdwlan_19323_id1.bin /mnt/vendor/persist/bdwlan_19323_id1.bin
        ;;
        "19325")
        cp /vendor/etc/wifi/bdwlan_19325_id1.bin /mnt/vendor/persist/bdwlan_19325_id1.bin
        ;;
        "19326")
        cp /vendor/etc/wifi/bdwlan_19326_id1.bin /mnt/vendor/persist/bdwlan_19326_id1.bin
        ;;
        "19327")
        cp /vendor/etc/wifi/bdwlan_19327_id1.bin /mnt/vendor/persist/bdwlan_19327_id1.bin
        ;;
        "19328")
        cp /vendor/etc/wifi/bdwlan_19328_id1.bin /mnt/vendor/persist/bdwlan_19328_id1.bin
        ;;
        "19329")
        cp /vendor/etc/wifi/bdwlan_19329_id1.bin /mnt/vendor/persist/bdwlan_19329_id1.bin
        ;;
    esac
    echo "$system_version" > /mnt/vendor/persist/bin_version
fi

#Min.Yi@PSW.CN.Wifi.Hardware.1065227, 2017/11/21,
#Add for : bin for according project
prj_version=`cat /proc/oppoVersion/prjVersion`
pcb_version=`cat /proc/oppoVersion/pcbVersion`
case $prj_version in
       "19021" )
        cp /mnt/vendor/persist/bdwlan_19021_id1.bin /mnt/vendor/persist/bdwlan.bin
       ;;
       "19022")
        cp /mnt/vendor/persist/bdwlan_19022_id1.bin /mnt/vendor/persist/bdwlan.bin
        ;;
        "19026")
        cp /mnt/vendor/persist/bdwlan_19026_id1.bin /mnt/vendor/persist/bdwlan.bin
        ;;
        "19027")
        cp /mnt/vendor/persist/bdwlan_19027_id1.bin /mnt/vendor/persist/bdwlan.bin
        ;;
        "19023")
        cp /mnt/vendor/persist/bdwlan_19023_id1.bin /mnt/vendor/persist/bdwlan.bin
        ;;
        "19025")
        cp /mnt/vendor/persist/bdwlan_19025_id1.bin /mnt/vendor/persist/bdwlan.bin
        ;;
        "19321")
        cp /mnt/vendor/persist/bdwlan_19321_id1.bin /mnt/vendor/persist/bdwlan.bin
        ;;
        "19322")
        cp /mnt/vendor/persist/bdwlan_19322_id1.bin /mnt/vendor/persist/bdwlan.bin
        ;;
        "19323")
        cp /mnt/vendor/persist/bdwlan_19323_id1.bin /mnt/vendor/persist/bdwlan.bin
        ;;
        "19325")
        cp /mnt/vendor/persist/bdwlan_19325_id1.bin /mnt/vendor/persist/bdwlan.bin
        ;;
        "19326")
        cp /mnt/vendor/persist/bdwlan_19326_id1.bin /mnt/vendor/persist/bdwlan.bin
        ;;
        "19327")
        cp /mnt/vendor/persist/bdwlan_19327_id1.bin /mnt/vendor/persist/bdwlan.bin
        ;;
        "19328")
        cp /mnt/vendor/persist/bdwlan_19328_id1.bin /mnt/vendor/persist/bdwlan.bin
        ;;
        "19329")
        cp /mnt/vendor/persist/bdwlan_19329_id1.bin /mnt/vendor/persist/bdwlan.bin
        ;;
esac






#ifdef VENDOR_EDIT
#Zuofa.Liu@PSW.CN.Wifi.Hardware, 2019/06/19,
#Add for make realme bin Rom-update.

#ifdef ODM_WT_EDIT
#Fanghua.zhu@ODM_WT.BSP.CON.WIFI.BugId,2019/12/17,Add for auto adapt RF param.
#pcbVesion 7 & 8 need use v17.bin
pcbVersion=`cat /proc/oppoVersion/pcbVersion`
#endif /*ODM_WT_EDIT*/

if [ -s /vendor/etc/wifi/bin_version_realme ]; then
    system_version=`cat /vendor/etc/wifi/bin_version_realme`
else
    system_version=1
fi

if [ -s /mnt/vendor/persist/bin_version_realme ]; then
    persist_version=`cat /mnt/vendor/persist/bin_version_realme`
else
    persist_version=0
fi

if [ ! -s /mnt/vendor/persist/bdwlan.bin  -o $system_version -gt $persist_version ]; then
    prj_version=`getprop  ro.separate.soft`
    case $prj_version in
        "19641" | "19647" | "19648" | "19630" | "19642" | "19645")
        cp /vendor/etc/wifi/bdwlan_19641.bin /mnt/vendor/persist/bdwlan_19641.bin
        ;;
        "19631")
        cp /vendor/etc/wifi/bdwlan_19631.bin /mnt/vendor/persist/bdwlan_19631.bin
        ;;
        "19632")
        cp /vendor/etc/wifi/bdwlan_19632.bin /mnt/vendor/persist/bdwlan_19632.bin
        ;;
        "19743" | "19675" | "19676" |"19683")
        #ifdef ODM_WT_EDIT
        #Fanghua.zhu@ODM_WT.BSP.CON.WIFI.BugId,2019/12/17,Add for auto adapt RF param.
        if [ $pcbVersion -ge "7" ]; then
            cp /vendor/etc/wifi/bdwlan_19743_v17.bin /mnt/vendor/persist/bdwlan_19743_v17.bin
        else
            cp /vendor/etc/wifi/bdwlan_19743.bin /mnt/vendor/persist/bdwlan_19743.bin
        fi
        ;;
        "19744")
        if [ $pcbVersion -ge "7" ]; then
            cp /vendor/etc/wifi/bdwlan_19744_v17.bin /mnt/vendor/persist/bdwlan_19744_v17.bin
        else
            cp /vendor/etc/wifi/bdwlan_19744.bin /mnt/vendor/persist/bdwlan_19744.bin
        fi
        #endif /*ODM_WT_EDIT*/
        ;;
        "19745")
        cp /vendor/etc/wifi/bdwlan_19745.bin /mnt/vendor/persist/bdwlan_19745.bin
        ;;
    esac
    echo "$system_version" > /mnt/vendor/persist/bin_version_realme
fi

prj_version=`getprop  ro.separate.soft`
case $prj_version in
    "19641" | "19647" | "19648" | "19630" | "19642" | "19645")
    cp /mnt/vendor/persist/bdwlan_19641.bin /mnt/vendor/persist/bdwlan.bin
    ;;
    "19631")
    cp /mnt/vendor/persist/bdwlan_19631.bin /mnt/vendor/persist/bdwlan.bin
    ;;
    "19632")
    cp /mnt/vendor/persist/bdwlan_19632.bin /mnt/vendor/persist/bdwlan.bin
    ;;
    "19743" | "19675" | "19676" | "19683")
    #ifdef ODM_WT_EDIT
    #Fanghua.zhu@ODM_WT.BSP.CON.WIFI.BugId,2019/12/17,Add for auto adapt RF param.
    if [ $pcbVersion -ge "7" ]; then
        cp /mnt/vendor/persist/bdwlan_19743_v17.bin /mnt/vendor/persist/bdwlan.bin
    else
        cp /mnt/vendor/persist/bdwlan_19743.bin /mnt/vendor/persist/bdwlan.bin
    fi
    ;;
    "19744")
    if [ $pcbVersion -ge "7" ]; then
        cp /mnt/vendor/persist/bdwlan_19744_v17.bin /mnt/vendor/persist/bdwlan.bin
    else
        cp /mnt/vendor/persist/bdwlan_19744.bin /mnt/vendor/persist/bdwlan.bin
    fi
    #endif /*ODM_WT_EDIT*/
    ;;
    "19745")
    cp /mnt/vendor/persist/bdwlan_19745.bin /mnt/vendor/persist/bdwlan.bin
    ;;
esac
#endif /* VENDOR_EDIT */






chmod 666 /mnt/vendor/persist/bdwlan.bin
chown system:wifi /mnt/vendor/persist/bdwlan.bin



#Yuan.Huang@PSW.CN.Wifi.Network.internet.1074197, 2016/11/09,
#Add for make WCNSS_qcom_cfg.ini Rom-update.
if [ -s /vendor/etc/wifi/WCNSS_qcom_cfg.ini ]; then
	system_version=`head -1 /vendor/etc/wifi/WCNSS_qcom_cfg.ini | grep OppoVersion | cut -d= -f2`
	if [ "${system_version}x" = "x" ]; then
		system_version=1
	fi
else
	system_version=1
fi

#if WCNSS_qcom_cfg_version exists, dut upgrades from android 7.0
if [ -s /mnt/vendor/persist/WCNSS_qcom_cfg_version ]; then
	persist_version=0
	rm /mnt/vendor/persist/WCNSS_qcom_cfg_version
else
	if [ -s /mnt/vendor/persist/WCNSS_qcom_cfg.ini ]; then
		persist_version=`head -1 /mnt/vendor/persist/WCNSS_qcom_cfg.ini | grep OppoVersion | cut -d= -f2`
		if [ "${persist_version}x" = "x" ]; then
			persist_version=0
		fi
	else
		persist_version=0
	fi
fi

if [ ! -s /mnt/vendor/persist/WCNSS_qcom_cfg.ini -o $system_version -gt $persist_version ]; then
    cp /vendor/etc/wifi/WCNSS_qcom_cfg.ini \
            /mnt/vendor/persist/WCNSS_qcom_cfg.ini
    chown system:wifi /mnt/vendor/persist/WCNSS_qcom_cfg.ini
    chmod 666 /mnt/vendor/persist/WCNSS_qcom_cfg.ini
fi

#else /* VENDOR_EDIT */
if false; then
# No path is set up at this point so we have to do it here.
PATH=/sbin:/system/sbin:/system/bin:/system/xbin
export PATH

# Trigger WCNSS platform driver
trigger_wcnss()
{
    # We need to trigger WCNSS platform driver, WCNSS driver
    # will export a file which we must touch so that the
    # driver knows that userspace is ready to handle firmware
    # download requests.

    # See if an appropriately named device file is present
    wcnssnode=`ls /dev/wcnss*`
    case "$wcnssnode" in
        *wcnss*)
            # Before triggering wcnss, let it know that
            # caldata is available at userspace.
            if [ -e /data/misc/wifi/WCNSS_qcom_wlan_cal.bin ]; then
                calparm=`ls /sys/module/wcnsscore/parameters/has_calibrated_data`
                if [ -e $calparm ] && [ ! -e /data/misc/wifi/WCN_FACTORY ]; then
                    echo 1 > $calparm
                fi
            fi
            # There is a device file.  Write to the file
            # so that the driver knows userspace is
            # available for firmware download requests
            echo 1 > $wcnssnode
            ;;

        *)
            # There is not a device file present, so
            # the driver must not be available
            echo "No WCNSS device node detected"
            ;;
    esac

    # Plumb down the device serial number
    if [ -f /sys/devices/*wcnss-wlan/serial_number ]; then
        cd /sys/devices/*wcnss-wlan
        echo $serialno > serial_number
        cd /
    elif [ -f /sys/devices/platform/wcnss_wlan.0/serial_number ]; then
        echo $serialno > /sys/devices/platform/wcnss_wlan.0/serial_number
    fi
}


case "$target" in
    msm8974* | msm8226* | msm8610*)

# Check whether device is plugged on the HSIC bus
# Currently HSIC bus will be the first index

    if [ -e /sys/bus/platform/drivers/msm_hsic_host ]; then
       if [ ! -L /sys/bus/usb/devices/1-1 ]; then
           echo msm_hsic_host > /sys/bus/platform/drivers/msm_hsic_host/unbind
       fi

       chown -h system.system /sys/bus/platform/drivers/msm_hsic_host/bind
       chown -h system.system /sys/bus/platform/drivers/msm_hsic_host/unbind
       chmod -h 0200 /sys/bus/platform/drivers/msm_hsic_host/bind
       chmod -h 0200 /sys/bus/platform/drivers/msm_hsic_host/unbind
    fi

    wlanchip=""

# force ar6004 is ar6004_wlan.conf existed.
    if [ -f /system/etc/firmware/ath6k/AR6004/ar6004_wlan.conf ]; then
        wlanchip=`cat /system/etc/firmware/ath6k/AR6004/ar6004_wlan.conf`
    fi

# auto detect ar6004-sdio card
# for ar6004-sdio card, the vendor id and device id is as the following
# vendor id  device id
#    0x0271     0x0400
#    0x0271     0x0401
    if [ "$wlanchip" == "" ]; then
        sdio_vendors=`echo \`cat /sys/bus/mmc/devices/*/*/vendor\``
        sdio_devices=`echo \`cat /sys/bus/mmc/devices/*/*/device\``
        ven_idx=0

        for vendor in $sdio_vendors; do
            case "$vendor" in
            "0x0271")
                dev_idx=0
                for device in $sdio_devices; do
                    if [ $ven_idx -eq $dev_idx ]; then
                        case "$device" in
                        "0x0400" | "0x0401" | "0x0402")
                            wlanchip="AR6004-SDIO"
                            ;;
                        *)
                            ;;
                        esac
                    fi
                    dev_idx=$(( $dev_idx + 1))
                done
                ;;
            *)
                ;;
            esac
            ven_idx=$(( $ven_idx + 1))
        done
    # auto detect ar6004-sdio card end
    fi

# for ar6004-usb card, the vendor id and device id is as the following
# vendor id  product id
#    0x0cf3     0x9374
#    0x0cf3     0x9372
    if [ "$wlanchip" == "" ]; then
        usb_vendors=`echo \`cat /sys/bus/usb/devices/*/*/idVendor\``
        usb_products=`echo \`cat /sys/bus/usb/devices/*/*/idProduct\``
        ven_idx=0

        for vendor in $usb_vendors; do
            case "$vendor" in
            "0cf3")
                dev_idx=0
                for product in $usb_products; do
                    if [ $ven_idx -eq $dev_idx ]; then
                        case "$product" in
                        "9374" | "9372")
                            wlanchip="AR6004-USB"
                            ;;
                        *)
                            ;;
                        esac
                    fi
                    dev_idx=$(( $dev_idx + 1))
                done
                ;;
            *)
                ;;
            esac
            ven_idx=$(( $ven_idx + 1))
        done
    # auto detect ar6004-usb card end
    fi

      echo "The WLAN Chip ID is $wlanchip"
      case "$wlanchip" in
      "AR6004-USB")
      echo msm_hsic_host > /sys/bus/platform/drivers/msm_hsic_host/unbind
      setprop wlan.driver.ath 2
      setprop vendor.bluetooth.soc ath3k
      btsoc="ath3k"
      rm  /system/lib/modules/wlan.ko
      ln -s /system/lib/modules/ath6kl-3.5/ath6kl_usb.ko \
		/system/lib/modules/wlan.ko
      rm /system/etc/firmware/ath6k/AR6004/hw1.3/fw.ram.bin
      rm /system/etc/firmware/ath6k/AR6004/hw1.3/bdata.bin
      ln -s /system/etc/firmware/ath6k/AR6004/hw1.3/fw.ram.bin_usb \
		/system/etc/firmware/ath6k/AR6004/hw1.3/fw.ram.bin
      ln -s /system/etc/firmware/ath6k/AR6004/hw1.3/bdata.bin_usb \
		/system/etc/firmware/ath6k/AR6004/hw1.3/bdata.bin
      rm /system/etc/firmware/ath6k/AR6004/hw3.0/bdata.bin
      ln -s /system/etc/firmware/ath6k/AR6004/hw3.0/bdata.bin_usb \
                /system/etc/firmware/ath6k/AR6004/hw3.0/bdata.bin

      # Use different wpa_supplicant.conf template between wcn driver
      # and ath6kl driver
      rm /system/etc/wifi/wpa_supplicant.conf
      ln -s /system/etc/wifi/wpa_supplicant_ath6kl.conf \
                /system/etc/wifi/wpa_supplicant.conf
      ;;

      "AR6004-SDIO")
      setprop wlan.driver.ath 2
      setprop vendor.bluetooth.soc ath3k
      btsoc="ath3k"
      # Chown polling nodes as needed from UI running on system server
      chmod -h 0200 /sys/devices/msm_sdcc.1/polling
      chmod -h 0200 /sys/devices/msm_sdcc.2/polling
      chmod -h 0200 /sys/devices/msm_sdcc.3/polling
      chmod -h 0200 /sys/devices/msm_sdcc.4/polling

      chown -h system.system /sys/devices/msm_sdcc.1/polling
      chown -h system.system /sys/devices/msm_sdcc.2/polling
      chown -h system.system /sys/devices/msm_sdcc.3/polling
      chown -h system.system /sys/devices/msm_sdcc.4/polling

      rm  /system/lib/modules/wlan.ko
      ln -s /system/lib/modules/ath6kl-3.5/ath6kl_sdio.ko \
		/system/lib/modules/wlan.ko
      rm /system/etc/firmware/ath6k/AR6004/hw1.3/fw.ram.bin
      rm /system/etc/firmware/ath6k/AR6004/hw1.3/bdata.bin
      ln -s /system/etc/firmware/ath6k/AR6004/hw1.3/fw.ram.bin_sdio \
		/system/etc/firmware/ath6k/AR6004/hw1.3/fw.ram.bin
      ln -s /system/etc/firmware/ath6k/AR6004/hw1.3/bdata.bin_sdio \
		/system/etc/firmware/ath6k/AR6004/hw1.3/bdata.bin
      rm /system/etc/firmware/ath6k/AR6004/hw3.0/bdata.bin
      ln -s /system/etc/firmware/ath6k/AR6004/hw3.0/bdata.bin_sdio \
                /system/etc/firmware/ath6k/AR6004/hw3.0/bdata.bin

      # Use different wpa_supplicant.conf template between wcn driver
      # and ath6kl driver
      rm /system/etc/wifi/wpa_supplicant.conf
      ln -s /system/etc/wifi/wpa_supplicant_ath6kl.conf \
                /system/etc/wifi/wpa_supplicant.conf
      ;;

      *)
      echo "*** WI-FI chip ID is not specified in /persist/wlan_chip_id **"
      echo "*** Use the default WCN driver.                             **"
      setprop wlan.driver.ath 0
      rm  /system/lib/modules/wlan.ko
      ln -s /system/lib/modules/pronto/pronto_wlan.ko \
		/system/lib/modules/wlan.ko
      # Populate the writable driver configuration file
      if [ ! -s /data/misc/wifi/WCNSS_qcom_cfg.ini ]; then
          cp /system/etc/wifi/WCNSS_qcom_cfg.ini \
		/data/misc/wifi/WCNSS_qcom_cfg.ini
          chown -h system:wifi /data/misc/wifi/WCNSS_qcom_cfg.ini
          chmod -h 660 /data/misc/wifi/WCNSS_qcom_cfg.ini
      fi

      # The property below is used in Qcom SDK for softap to determine
      # the wifi driver config file
      setprop wlan.driver.config /data/misc/wifi/WCNSS_qcom_cfg.ini

      # Use different wpa_supplicant.conf template between wcn driver
      # and ath6kl driver
      rm /system/etc/wifi/wpa_supplicant.conf
      ln -s /system/etc/wifi/wpa_supplicant_wcn.conf \
                /system/etc/wifi/wpa_supplicant.conf

      # Trigger WCNSS platform driver
      trigger_wcnss &
      ;;
      esac
      ;;

    apq8084*)
      echo "*** Use the CNSS CLD driver.**"
      setprop wlan.driver.ath 0

      # Use different wpa_supplicant.conf template between wcn driver
      # and ath6kl driver
      rm /system/etc/wifi/wpa_supplicant.conf
      ln -s /system/etc/wifi/wpa_supplicant_wcn.conf \
                /system/etc/wifi/wpa_supplicant.conf
    ;;

    msm8960*)

      # Move cfg80211.ko to prima directory, the default cfg80211.ko is
      # for wcnss solution
      if [ ! -L /system/lib/modules/cfg80211.ko ]; then
          mv /system/lib/modules/cfg80211.ko /system/lib/modules/prima/
      fi

      wlanchip=""

      if [ -f /system/etc/firmware/ath6k/AR6004/ar6004_wlan.conf ]; then
          wlanchip=`cat /system/etc/firmware/ath6k/AR6004/ar6004_wlan.conf`
      fi

      if [ "$wlanchip" == "" ]; then
          # auto detect ar6004-usb card
          # for ar6004-usb card, the vendor id and device id is as the following
          # vendor id  product id
          #    0x0cf3     0x9374
          #    0x0cf3     0x9372
          usb_vendors=`echo \`cat /sys/bus/usb/devices/*/*/idVendor\``
          usb_products=`echo \`cat /sys/bus/usb/devices/*/*/idProduct\``
          ven_idx=0

          for vendor in $usb_vendors; do
              case "$vendor" in
              "0cf3")
                  dev_idx=0
                  for product in $usb_products; do
                      if [ $ven_idx -eq $dev_idx ]; then
                          case "$product" in
                          "9374" | "9372")
                              wlanchip="AR6004-USB"
                              ;;
                          *)
                              ;;
                          esac
                      fi
                      dev_idx=$(( $dev_idx + 1))
                  done
                  ;;
              *)
                  ;;
              esac
              ven_idx=$(( $ven_idx + 1))
          done
          # auto detect ar6004-usb card end
      fi

      if [ "$wlanchip" == "" ]; then
          # auto detect ar6004-sdio card
          # for ar6004-sdio card, the vendor id and device id is
          # as the following
          # vendor id  device id
          #    0x0271     0x0400
          #    0x0271     0x0401
          sdio_vendors=`echo \`cat /sys/bus/mmc/devices/*/*/vendor\``
          sdio_devices=`echo \`cat /sys/bus/mmc/devices/*/*/device\``
          ven_idx=0

          for vendor in $sdio_vendors; do
              case "$vendor" in
              "0x0271")
                  dev_idx=0
                  for device in $sdio_devices; do
                      if [ $ven_idx -eq $dev_idx ]; then
                          case "$device" in
                          "0x0400" | "0x0401")
                              wlanchip="AR6004-SDIO"
                              ;;
                          *)
                              ;;
                          esac
                      fi
                      dev_idx=$(( $dev_idx + 1))
                  done
                  ;;
              *)
                  ;;
              esac
              ven_idx=$(( $ven_idx + 1))
          done
          # auto detect ar6004-sdio card end
      fi

      echo "The WLAN Chip ID is $wlanchip"
      case "$wlanchip" in
      "AR6004-USB")
        setprop wlan.driver.ath 2
        rm  /system/lib/modules/wlan.ko
        rm  /system/lib/modules/cfg80211.ko
        ln -s /system/lib/modules/ath6kl-3.5/ath6kl_usb.ko \
		/system/lib/modules/wlan.ko
        ln -s /system/lib/modules/ath6kl-3.5/cfg80211.ko \
		/system/lib/modules/cfg80211.ko
        rm /system/etc/firmware/ath6k/AR6004/hw1.3/fw.ram.bin
        rm /system/etc/firmware/ath6k/AR6004/hw1.3/bdata.bin
        ln -s /system/etc/firmware/ath6k/AR6004/hw1.3/fw.ram.bin_usb \
		/system/etc/firmware/ath6k/AR6004/hw1.3/fw.ram.bin
        ln -s /system/etc/firmware/ath6k/AR6004/hw1.3/bdata.bin_usb \
		/system/etc/firmware/ath6k/AR6004/hw1.3/bdata.bin

        # Use different wpa_supplicant.conf template between wcn driver
        # and ath6kl driver
        rm /system/etc/wifi/wpa_supplicant.conf
        ln -s /system/etc/wifi/wpa_supplicant_ath6kl.conf \
                /system/etc/wifi/wpa_supplicant.conf
        ;;
      "AR6004-SDIO")
        setprop wlan.driver.ath 2
        setprop qcom.bluetooth.soc ath3k
        btsoc="ath3k"
        rm  /system/lib/modules/wlan.ko
        rm  /system/lib/modules/cfg80211.ko
        ln -s /system/lib/modules/ath6kl-3.5/ath6kl_sdio.ko \
		/system/lib/modules/wlan.ko
        ln -s /system/lib/modules/ath6kl-3.5/cfg80211.ko \
		/system/lib/modules/cfg80211.ko
        rm /system/etc/firmware/ath6k/AR6004/hw1.3/fw.ram.bin
        rm /system/etc/firmware/ath6k/AR6004/hw1.3/bdata.bin
        ln -s /system/etc/firmware/ath6k/AR6004/hw1.3/fw.ram.bin_sdio \
		/system/etc/firmware/ath6k/AR6004/hw1.3/fw.ram.bin
        ln -s /system/etc/firmware/ath6k/AR6004/hw1.3/bdata.bin_sdio \
		/system/etc/firmware/ath6k/AR6004/hw1.3/bdata.bin

        # Use different wpa_supplicant.conf template between wcn driver
        # and ath6kl driver
        rm /system/etc/wifi/wpa_supplicant.conf
        ln -s /system/etc/wifi/wpa_supplicant_ath6kl.conf \
                  /system/etc/wifi/wpa_supplicant.conf
        ;;
      *)
        echo "*** WI-FI chip ID is not specified in /persist/wlan_chip_id **"
        echo "*** Use the default WCN driver.                             **"
        setprop wlan.driver.ath 0
        rm  /system/lib/modules/wlan.ko
        rm  /system/lib/modules/cfg80211.ko
        ln -s /system/lib/modules/prima/prima_wlan.ko \
		/system/lib/modules/wlan.ko
        ln -s /system/lib/modules/prima/cfg80211.ko \
		/system/lib/modules/cfg80211.ko

        # The property below is used in Qcom SDK for softap to determine
        # the wifi driver config file
        setprop wlan.driver.config /data/misc/wifi/WCNSS_qcom_cfg.ini

        # Use different wpa_supplicant.conf template between wcn driver
        # and ath6kl driver
        rm /system/etc/wifi/wpa_supplicant.conf
        ln -s /system/etc/wifi/wpa_supplicant_wcn.conf \
                  /system/etc/wifi/wpa_supplicant.conf

        # Trigger WCNSS platform driver
        trigger_wcnss &
        ;;
      esac
      ;;

    msm7627a*)

        # The default cfg80211 module is for volans
        if [ ! -L /system/lib/modules/cfg80211.ko ]; then
            mv /system/lib/modules/cfg80211.ko /system/lib/modules/volans/
        fi

        wlanchip=`cat /persist/wlan_chip_id`
        echo "The WLAN Chip ID is $wlanchip"
        case "$wlanchip" in
            "ATH6KL")
             setprop wlan.driver.ath 1
             rm  /system/lib/modules/wlan.ko
             rm  /system/lib/modules/cfg80211.ko
             ln -s /system/lib/modules/ath6kl/ath6kl_sdio.ko \
		/system/lib/modules/wlan.ko
             ln -s /system/lib/modules/ath6kl/cfg80211.ko \
		/system/lib/modules/cfg80211.ko
             ;;
            "WCN1314")
             setprop wlan.driver.ath 0
             rm  /system/lib/modules/wlan.ko
             rm  /system/lib/modules/cfg80211.ko
             ln -s /system/lib/modules/volans/WCN1314_rf.ko \
		/system/lib/modules/wlan.ko
             ln -s /system/lib/modules/volans/cfg80211.ko \
		/system/lib/modules/cfg80211.ko
             ;;
            *)
             setprop wlan.driver.ath 1
             rm  /system/lib/modules/wlan.ko
             rm  /system/lib/modules/cfg80211.ko
             ln -s /system/lib/modules/ath6kl/ath6kl_sdio.ko \
		/system/lib/modules/wlan.ko
             ln -s /system/lib/modules/ath6kl/cfg80211.ko \
		/system/lib/modules/cfg80211.ko
             echo "************************************************************"
             echo "*** Error:WI-FI chip ID is not specified in"
             echo "/persist/wlan_chip_id"
             echo "*******    WI-FI may not work    ***************************"
             ;;
        esac
    ;;

    msm7627*)
        ln -s /data/hostapd/qcom_cfg.ini /etc/firmware/wlan/qcom_cfg.ini
        ln -s /persist/qcom_wlan_nv.bin /etc/firmware/wlan/qcom_wlan_nv.bin
    ;;

    msm8660*)
    ;;

    msm7630*)
    ;;

    *)
      ;;
esac
fi
#endif /* VENDOR_EDIT */
