# Nebra AnyBeam Software

There are 4 modes that can be configured with the Nebra AnyBeam HAT:

* Mode 1 - RGB 888
* Mode 2 - RGB 666
* Mode 3 - RGB 666 + GPIO 26
* Mode 4 - RGB 66 + GPIO 26 + GPIO 27

##Auto Configuration

Coming soon

##Manual Configuration

You will need to edit the config.txt file on the Raspberry Pi before you can use the AnyBeam HAT. To do this you can either insert the micro SD into your computer or you can edit by booting up the Raspberry Pi with a monitor, keyboard & mouse connected.

**Step 1** - Edit the config.txt

![](https://user-images.githubusercontent.com/1878314/57297747-5b5b7000-70c8-11e9-8ac1-bb4c56902582.png)

**Step 2** - Open config.txt

![](https://user-images.githubusercontent.com/1878314/57297890-b8572600-70c8-11e9-966a-00647a39ef32.png)

**Step 3** - Edit line 53

Go to line 53 in the config.txt file:

```
# Additional overlays and parameters are documented /boot/overlays/README
```
![](https://user-images.githubusercontent.com/1878314/57298612-8646c380-70ca-11e9-8966-35a1be460673.png)

**Step 4** - Add the following lines to configure your mode (Mode 1 is default):

###Mode 1 - RGB 888 (24 bits - 8 bits for Red, Green, Blue)
```
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
```

###Mode 2 - RGB 666 (18 bits - 6 bits for Red, Green, Blue) + GPIO 26 and GPIO 27
```
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
```

###Mode 3 - RGB 666 + GPIO 27 + Button (GPIO 26)
```
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
```

###Mode 4 - RGB 666 + GPIO 26 with 4.7k pull-up resistor + GPIO 27 with 4.7k pull-up resistor
```
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
```
**NOTE:** ```i2cdetect -l``` can find the new i2c adapter i2c-3

![](https://user-images.githubusercontent.com/1878314/57300134-11758880-70ce-11e9-884d-fdf5eacd57d0.png)

**Step 5** - Save and boot

Save the config.txt with your new changes and the remove the microSD card and insert into your Raspberry Pi. Apply power to your Raspberry Pi to boot with the new changes. Then, wait a few minutes to allow the Nebra AnyBeam HAT laser projector to boot.
