#!/bin/sh

# configure config.txt and cmdline.txt
case "${2}" in                                                                  
  --use-uboot)                                                
  echo "Use u-boot bootloader"
  sed -e '/^kernel=/s,=.*,=u-boot.bin,' -i "${BINARIES_DIR}/rpi-firmware/config.txt"
  ;; 
esac

grep -q -F 'device_tree_address=' ${BINARIES_DIR}/rpi-firmware/config.txt || echo 'device_tree_address=0x100' >> ${BINARIES_DIR}/rpi-firmware/config.txt
grep -q -F 'device_tree=' ${BINARIES_DIR}/rpi-firmware/config.txt || echo 'device_tree=bcm2837-rpi-3-b.dtb' >> ${BINARIES_DIR}/rpi-firmware/config.txt
grep -q -F 'enable_uart=' ${BINARIES_DIR}/rpi-firmware/config.txt || echo 'enable_uart=1' >> ${BINARIES_DIR}/rpi-firmware/config.txt

grep -q -F 'dwc_otg.lpm_enable=0' ${BINARIES_DIR}/rpi-firmware/cmdline.txt || sed -i.bak 's/^/dwc_otg.lpm_enable=0 /' ${BINARIES_DIR}/rpi-firmware/cmdline.txt
