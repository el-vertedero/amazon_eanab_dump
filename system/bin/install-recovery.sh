#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/soc0/soc.2/by-name/recovery:6187008:8d02630c33b937aaadb3b6ac1cd73b6cb9387e8d; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/soc0/soc.2/by-name/boot:5623808:0fb306ee7047dc6515bb82ed1fbbdb923e73f665 EMMC:/dev/block/platform/soc0/soc.2/by-name/recovery 8d02630c33b937aaadb3b6ac1cd73b6cb9387e8d 6187008 0fb306ee7047dc6515bb82ed1fbbdb923e73f665:/system/recovery-from-boot.p && echo "
Installing new recovery image: succeeded
" >> /cache/recovery/log || echo "
Installing new recovery image: failed
" >> /cache/recovery/log
else
  log -t recovery "Recovery image already installed"
fi
