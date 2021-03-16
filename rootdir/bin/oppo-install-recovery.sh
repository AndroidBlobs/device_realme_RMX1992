#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:100663296:7ab3e46c52382687a1837248bc53e16674f95c86; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:c7a99c379bc3358568a8ba9e75dff468b968bada \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:100663296:7ab3e46c52382687a1837248bc53e16674f95c86 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
