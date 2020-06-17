#!/usr/bin/env bash

#Check if script is being run as root
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi
apt update
apt install whiptail -y

Option=""
while [ "$Option" = "" ]; do
   Option=$(whiptail --title "Please select installation mode"  --menu  "" 12 50 4 \
   "1"  "RGB 888 (default) " \
   "2"  "RGB 666           " \
   "3"  "RGB 666 + GPIO26   " \
   "4"  "RGB 666 + GPIO26 +GPIO27   "  3>&1 1>&2 2>&3)
   if [ $? = 1 ]; then
      whiptail --msgbox "No version selected. Try again" 8 40
   fi
done

{
        sleep 2
        echo -e  "XXX\n25\nRemoving any exisiting configuration\nXXX"
        if grep -Fxq "#AnyBeam" /boot/config.txt; then
            sed -i '/#AnyBeam/,$d' /boot/config.txt
        fi
        sleep 2
        echo -e  "XXX\n50\nConfiguraing AnyBeam Mode\nXXX"
        case $Option in
         1 )
         cat >> /boot/config.txt <<EOF
#AnyBeam
dtoverlay=dpi24
overscan_left=0
overscan_right=0
overscan_top=0
overscan_bottom=0
framebuffer_width=1280
framebuffer_height=720
enable_dpi_lcd=1
display_default_lcd=1
dpi_group=2
dpi_mode=85
dpi_output_format=0x070027
EOF
;;

         2 )
         cat >> /boot/config.txt <<EOF
#AnyBeam
dtoverlay=dpi24
overscan_left=0
overscan_right=0
overscan_top=0
overscan_bottom=0
framebuffer_width=1280
framebuffer_height=720
enable_dpi_lcd=1
display_default_lcd=1
dpi_group=2
dpi_mode=85
dpi_output_format=0x070026
EOF
;;

         3 )
         cat >> /boot/config.txt <<EOF
#AnyBeam
dtoverlay=dpi24
overscan_left=0
overscan_right=0
overscan_top=0
overscan_bottom=0
framebuffer_width=1280
framebuffer_height=720
enable_dpi_lcd=1
display_default_lcd=1
dpi_group=2
dpi_mode=85
dpi_output_format=0x070026
EOF
;;

          4 )
          cat >> /boot/config.txt <<EOF
#AnyBeam
dtoverlay=dpi24
overscan_left=0
overscan_right=0
overscan_top=0
overscan_bottom=0
framebuffer_width=1280
framebuffer_height=720
enable_dpi_lcd=1
display_default_lcd=1
dpi_group=2
dpi_mode=85
dpi_output_format=0x070026
dtoverlay=i2c-gpio,i2c_gpio_delay_us=1,i2c_gpio_sda=26,i2c_gpio_scl=27
EOF
;;
  esac
        sleep 2
        echo -e  "XXX\n100\nConfiguration Complete\nXXX"
        sleep 2
} | whiptail --title "AnyBeam Configuration" --gauge "Please wait whilst configuration completes" 6 60 0


if (whiptail --title "Configuration Complete" --yesno "Do you want to reboot?" 8 78); then
    reboot
else
    exit 0
fi
