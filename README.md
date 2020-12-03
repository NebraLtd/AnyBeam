![nebra-anybeam-logo-large](https://user-images.githubusercontent.com/1878314/73881114-b12b9700-4857-11ea-98a3-f8b1825712f1.png)

# Nebra AnyBeam

Resources for the Nebra AnyBeam range of Pico laser projectors, originally funded through KickStarter. Nebra AnyBeam is the worlds smallest pocket projector with the power to project a crystal clear picture on any surface. Simply plug and play with your smart phone, laptop or tablet to watch your favourite content on the big screen, powered by an ordinary power bank or from a USB port on your computer.

## Overview

The AnyBeam pico laser projectors technology is super efficient and does not generate excessive amounts of heat, like some older generation of projectors. This in turn means that we don't need to add any noisy fans inside to keep everything nice and cool, it will never interrupt your viewing experience.

AnyBeam uses lasers instead of the traditional LEDs or bulbs. This increases the overall lifetime by a factor of 10 over those traditional methods. Over many years this drastically saves money throughout its lifetime.

The laser MEMS technology, which is at the heart of the Nebra AnyBeam projector range is incredibly light and compact. This means we were able to fit it into a small form factor and even produce a HAT board for the Raspberry Pi, allowing you to literally take it anywhere you want.

**Features:**

* Low Power -  consumption as low as 3W
* Focus Free - Always in focus as the laser beam barely spreads
* No Bulb - Utilises a MEMS scanner which means no bulb is required
* Fanless - MEMS scanner reduces the need for a fan, no noise!
* Light Weight - Weighs just 140g
* Pocket Size - Low profile form factor

## Form Factors

**Nebra AnyBeam**

![b8f7ec4b2d2f8f3897999d99f02b0947_original](https://user-images.githubusercontent.com/1878314/57292254-41fef780-70b9-11e9-8648-7d9a429ec244.png)

**Nebra AnyBeam Developers Kit**

![ec2c43f6176e7998fde19ff84fdf9c92_original](https://user-images.githubusercontent.com/1878314/57292297-53480400-70b9-11e9-9586-6667ca1f9d72.png)

**Nebra AnyBeam HAT for Raspberry Pi**

![5732bad89c3970f325703b57957552ed_original](https://user-images.githubusercontent.com/1878314/57292326-6064f300-70b9-11e9-99e8-174aae8a9c77.png)

**Nebra AnyBeam Monster Ball**

![fef04f88cac4d2ad8462f001d77f57a7_original](https://user-images.githubusercontent.com/1878314/57292457-a457f800-70b9-11e9-9c00-1fb0904eef92.png)

## Reviews and links
Here are some links to reviews and articles from around the web:

* hackster.io - [A Pico Projector for the Raspberry Pi?](https://blog.hackster.io/a-pico-projector-for-the-raspberry-pi-ba23e70da9f9)
* hackster.io - [Unboxing Video](https://www.facebook.com/hacksterio/videos/321714168512741/)
* Hackaday article - [A petite pico projector for the portable pi](https://hackaday.com/2019/04/07/a-petite-pico-projector-for-portable-pi/)

## Projects

## Troubleshooting

### No Image Displayed on Screen
Indicator 1 off - The USB cable is not connected properly. Ensure the USB cables and power connection us securely connected and power supply spec should be DC 5V, 1.5A.

Indicator 1 flashing - Due to unknown issue, the device enables protected mode. Re-plug the power cable to reset the device. If the problem still exists, please change another power adapter (with DC 5V, 1.5A output) and try it again.

Indicator 2 flashing per 3 sec, Indicator 1 off - The device has enabled ECO mode Due to the video source has no signal output for a long time, the device will enable ECO mode automatically. Please push the function key, the device will back to normal status

### The screen shows "NO SIGNAL"
No Image on the screen with Indicator 1 is on and Indicator 2 is off - Ensure video/audio cable is securely connected on both ends(input and output).

No Image on the screen with Indicator 1 is on and Indicator 2 is off - Please make sure the projector is on the correct video input. And try reseating (unplug, plug back in) the video/audio cable on either end.

### Display image is abnormal
The projected colour is abnormal - Ensure the colour of output device is correct; Reset the projector by power on/off (unplug USB cable, plug back in).

The projected image is jumping or shaking - Reset the projector by power on/off (USB cable
unplug, plug back in). Please change another power adapter (with DC 5V, 1.5A output) and try it again. Please keep the device from other magnet devices. The projector is sitting on an unstable or vibrating surface (such as speaker).

The projected blurry image - Please press function key for more than 3 seconds to enter OSD operation mode, select [Sharpness Adjustment] to make adjustment.

Unexpected colour on screen edge/ character edge - Please press function key for more than 3 seconds to enter OSD operation mode, select [Green Alignment] or [Blue Alignment]to make adjustment.

Shows blurred and hazy images - Please make sure the cover glass of projector is clean and check again whether it works.

Projected image is jittering or shaking - Ensure the input resolution is 720p.

Other display image abnormal - Re-plug the power cable to reset the device, check if the problem still exists.

### No Audio output
Image is projected, but no audio output - Please check the source device audio setting.

Image is projected, but no audio output --Projector is in mute mode - Please press the function keys up or down until the volume bar appears in the screen, then confirm whether it is in mute mode.

Another abnormal audio output - Reset the projector by power on/off (USB cable unplug, plug back in).

### Can I power the AnyBeam from the Raspberry Pi USB?

Yes, the AnyBeam can be powered using the Raspberry Pi USB port. You will however need to force the HDMI output to use 720p by editing the `/boot/config.txt` file and add the following:
```
hdmi_force_hotplug=1
hdmi_group=1
hdmi_mode=4
```

## Power Information

### Consumption FAQs
A Frequently Asked question is the power consumption of the Anybeam range, How can the power consumption be as low as 3W but the PSU required is 1.5A?

Due to the nature of how Anybeam works, the laser module only consumes power for the power where shown and not the entire projection window so in darker scenes or cases where only a portion of the screen has an image on the power consumption is significantly less.

In our testing when watching a typical movie the projector draws around 0.7-0.8A, we also done full screen testing with the primary colours to get some further measurements:

* Fully Black Screen - 0.5A
* Fully White Screen - 1.1A
* Fully Red Screen - 0.65A
* Fully Green Screen - 0.8A
* Fully Blue Screen - 0.7A

For most applications based on the above information a typical consumption of 1A should be calculated for, with peaks of 1.5A (hence the 1.5A power adaptor requirement.)

The above tests were performed to be a rough guideline and unit to unit variations may apply as well. The standalone model was measured however power consumption for the Development Kit & HAT should be fairly similar as they use the same hardware.

For the HAT variation the total power required will be higher from where you are also powering the Raspberry Pi, in these cases a power supply of at least 3A should be used on a Pi 4, and 2.5A on Model 3B+ and below.

### Battery Power

We've had a few customers ask how big of a battery bank is required to power the unit for certain periods of time.

Here's some rough guidelines based on the above information we make the following recommendations:

* 5,000mAh Battery -  Approximately 2 Hours, 45 Minutes.
* 10,000mAh Battery - Approximately 5 Hours
* 15,000mAh Battery - Approximately 8 Hours
* 20,000mAh Battery - Approximately 10 Hours

Please note the above is only rough estimates as the quality of battery between battery banks may vary and not all capacities between different brands. We've based this on a power consumption of 1A however as explained above when projecting very bright video scenes , white images etc the time may be less, with darker scenes and partial projection it may be longer.

Calculations have been made on a basis of 80% efficiency of the battery pack.

## Safety Instructions
* Do not drop or apply impact to LSP display module
* Do not expose LSP display module to water or heat sources.
* Do not use any metal item to direct touch HD301D1 module & H2M PCBA surface.
* Please operate the LSP module under recommend ambient temperature ( 5℃~35℃).

## Laser Safety Information
* HD301D1 is a Class 1 LASER PRODUCT(IEC/EN 60825-1:2014)
* BEWARE: eye injuries can be caused by laser beams, do not look at the laser beam directly.
* THIS LABEL CONTAINS IMPORTANT INFORMATION. DO NOT REMOVE THAT.

![safety_label](https://user-images.githubusercontent.com/1878314/74422820-1fb7b880-4e47-11ea-9956-1f20cc75ea9a.png)

![laser_spec](https://user-images.githubusercontent.com/1878314/74422815-1f1f2200-4e47-11ea-9591-8d839c879275.png)
