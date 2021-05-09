#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:67108864:77fcfa90dadc90d87c916488c9953e801fa7c430; then
  applypatch  EMMC:/dev/block/bootdevice/by-name/boot:67108864:69ef0c28139de111f26c335b15010ba0267b8d03 EMMC:/dev/block/bootdevice/by-name/recovery 77fcfa90dadc90d87c916488c9953e801fa7c430 67108864 69ef0c28139de111f26c335b15010ba0267b8d03:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
