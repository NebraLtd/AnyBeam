#Hardware

##Raspberry Pi HAT Board
![Boards](https://user-images.githubusercontent.com/1878314/57307840-2c9bc480-70dd-11e9-9185-0326f58ccc3d.png)

1. 2x20 GPIO female header for connecting to the Raspberry Pi
2. 30-pin FPC connector, which is used to connect to the MEMS laser module
3. Micro USB connector to delver power to the module and Raspberry Pi
4. Jumper pins for mode selection
5. 2x4 Female header to connect to the control board

##Control Board
![Control](https://user-images.githubusercontent.com/1878314/57311917-789e3780-70e4-11e9-907a-8d0f5d20c1af.png)

1. 2x4 Male header to connect to the HAT projector board for the Raspberry Pi
2. Status LED:
   * Light up - When projector is powered on
   * Flashing - An error has occurred
3. Through hole pinout header:
   * 3V3 - This is the output from the on-board 3.3V regulator. It can provide 100mA output
   * GND - Command ground for power and logic
   * GPIO 26 - This is GPIO pin 26 from the Raspberry Pi
   * GPIO 27 - This is GPIO pin 27 from the Raspberry Pi
4. Function Switches:
   * Enter - Press ad hold this down for 4~6 seconds to enter or exit the OSD mode
   * Up Arrow - This switch is for up direction when navigating the menu
   * Down Arrow - This switch is for down direction when navigating the menu
   * GPIO - This user-defined momentary switch, which is connected to GPIO 26 and only for Mode 3:
     * Default status is OFF
5. Jumper JP - Bridge this jumper for mode 3 selection

##AnyBeam Projector Modes

There are 4 modes available for configuration on the Projector HAT. You may need a soldering iron and and desoldering braid to adjust the Mode by bridge or remove the solder pads on the PCBA. See each  mode below for further details.

###Mode 1 - RGB 888 (24 bits - 8bits for red, green and blue)
In this mode, we use every pin availble on the Raspberry Pi. That means you don't get the standard users i2c pins, the UART(Tx/Rx)pins, the EEPROM i2c pins and the hardware SPI pins. Instead, you do get to use the USB ports, HDMI port and the CSI port.

**NOTE:** The configured default mode for the HAT projector is mode 1 (no jumpers required).

![HD301D1-R1_User Guide_Page_13_Image_0002](https://user-images.githubusercontent.com/1878314/57315673-f580df80-70eb-11e9-9d51-ec03f660af7e.jpg)
![HD301D1-R1_User Guide_Page_13_Image_0003](https://user-images.githubusercontent.com/1878314/57315703-06315580-70ec-11e9-8bf4-dd6b58aac2cf.jpg)

###Mode 2 - RGB 666 (18 bits, 6 bits per colour) + GPIO 26 and 27
In this mode you get to use GPIO 26 and 27 from the Raspberry Pi.

**Step 1** - Use some desoldering braid to remove the solder from the JP solder pads.
![HD301D1-R1_User Guide_Page_14_Image_0002](https://user-images.githubusercontent.com/1878314/57318135-85755800-70f1-11e9-9ff4-1ead84756904.jpg)
![HD301D1-R1_User Guide_Page_14_Image_0004](https://user-images.githubusercontent.com/1878314/57318277-d4bb8880-70f1-11e9-8902-5f661a5770ea.jpg)

**Step 2** - Use a soldering iron and some solder to bridge the solder pads like in the below image. This must be done on the reverse side of the PCBA.
![HD301D1-R1_User Guide_Page_14_Image_0003](https://user-images.githubusercontent.com/1878314/57318704-d6398080-70f2-11e9-97c9-fb148385ad01.jpg)

###Mode 3 - RGB 666 + GPIO 27 + Button(GPIO 26)
In this mode you get to use GPIO 27 and the user-defined switch on the control board, which is connected to GPIO pin 26.

**Step 1** - Follow the steps in Mode 2.

**Step 2** - Use a soldering iron to short out the JP solder pads on the control board as shown below.
![HD301D1-R1_User Guide_Page_15_Image_0002](https://user-images.githubusercontent.com/1878314/57319291-2a913000-70f4-11e9-952d-8bdc5007f8d5.jpg)
![HD301D1-R1_User Guide_Page_15_Image_0003](https://user-images.githubusercontent.com/1878314/57319315-35e45b80-70f4-11e9-9768-dd32b70a5ea8.jpg)

###Mode 4 - RGB 666 + GPIO 26 and GPIO 27 with 4.7k resistors.
In this mode you will create an additional I2C bus using GPIO pins 26 and 27.

**Step 1** - Follow the steps in Mode 2.
**Step 2** - Use the soldering iron to short pins labelled "PULL UP" on the HAT board.
![HD301D1-R1_User Guide_Page_15_Image_0004](https://user-images.githubusercontent.com/1878314/57324908-ce80d880-7100-11e9-95a8-ef2507e3a8a8.jpg)
