#!/usr/bin/env bash

script_path=$(readlink -f "${0%/*}")
work_dir="work"

arch_chroot() {
    arch-chroot "${script_path}/${work_dir}/x86_64/airootfs/" /bin/bash -c "${1}"
}

do_merge() {

arch_chroot "$(cat << EOF

echo "##############################"
echo "        Run in Chroot        "
echo "##############################"

cd /
systemctl enable NetworkManager.service

pacman-key --init
pacman-key --populate


echo "############################"
echo "#   ended chrooted.sh       #"
echo "############################"

EOF
)"
}

do_merge

