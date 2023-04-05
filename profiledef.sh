#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="asterlinux"
iso_label="ASTER_$(date +%Y%m)"
iso_publisher="Aster Linux <https://asterlinux.github.io>"
iso_application="Aster Linux Live/Rescue CD"
iso_version="$(date +%Y.%m.%d)"
#gpg_key="3FE52EDE0F5FAA9D18B951D1A8C0CEF9F5F15DB2"
#gpg_sender="sahan.user@gmail.com"
install_dir="arch"
buildmodes=('iso')
bootmodes=('bios.syslinux.mbr' 'bios.syslinux.eltorito'
           'uefi-ia32.grub.esp' 'uefi-x64.grub.esp'
           'uefi-ia32.grub.eltorito' 'uefi-x64.grub.eltorito')
arch="x86_64"
out_dir="out"
work_dir="work"
pacman_conf="airootfs/etc/pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'xz' '-Xbcj' 'x86' '-b' '1M' '-Xdict-size' '1M')
file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/root"]="0:0:750"
  ["/root/.automated_script.sh"]="0:0:755"
  ["/etc/shadow"]="0:0:0400"
  ["/etc/gshadow"]="0:0:0400"
  ["/etc/skel/.bashrc"]="0:0:755"
  ["/etc/sudoers.d/"]="0:0:750"
  ["/etc/sudoers.d/g_wheel"]="0:0:644"
  ["/etc/skel/.bash_profile"]="0:0:755"
  ["/etc/grub.d/31_hold_shift"]="0:0:755"
  ["/etc/grub.d/40_custom"]="0:0:755"
)
