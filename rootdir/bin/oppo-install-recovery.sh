#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:100663296:9043f8d75f5d4b6e4f3d536e2140083d5df5c27c; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:dfa48a83a913e6b3c0cf333b0e44d120cfce84f6 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:100663296:9043f8d75f5d4b6e4f3d536e2140083d5df5c27c && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
