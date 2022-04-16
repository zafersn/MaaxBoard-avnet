# MaaxBoard GPIO

Table of contents
=================

<!--ts-->
  * [ 40 Pin Expansion Pin Header Definition (J1O Header)](#40-pin-expansion-pin-header-definition-j1o-header)
  * [ How to calculate GPIO pin number](#how-to-calculate-gpio-pin-number)
  
<!--te-->


## 40 Pin Expansion Pin Header Definition (J1O Header)

![40Pin Pin Header Pin1 Position](pics/maxboardpinout_DVkjJFglZm.jpg)


| Maax Pin Num | SYS PIN NUM| Package Pin   | GPIO | Pin Name | Signal Type |  DT Defination
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------|
| 1 || |  |NVCC_3V3 | Power  |  
| 2 || |  |5V_IN | Power  |  
| 3 || F7| GPIO5_IO17(GPIO5) |I2C2_SDA | IO | MX8MQ_IOMUXC_I2C2_SCL_GPIO5_IO16 |
| 4 || |  |5V_IN | Power |  
| 5 || G7| GPIO5_IO16(GPIO5) |I2C2_SCL | IO | MX8MQ_IOMUXC_I2C2_SDA_GPIO5_IO17 |
| 6 || |  |GND | Ground |  
| 7 || K20 | GPIO3_IO16 | NAND_READY_B | IO |  
| 8 || A7| GPIO5_IO23(GPIO5) |UART1_TXD | IO | 
| 9 || |  |GND | Ground |  
| 10 || C7| GPIO5_IO22(GPIO5) |UART1_RXD  | IO |  
| 11 || K22| GPIO3_IO17 |   | IO |  
| 12 || J5| GPIO4_IO25(GPIO4) |SAI2_TXC  | IO |  
| 13 || H22| GPIO3_IO08(GPIO3) |  | IO | MX8MQ_IOMUXC_NAND_DATA02_GPIO3_IO8 |  
| 14 || | |GND | Ground |  
| 15 || J21| GPIO3_IO09 |  | IO |  MX8MQ_IOMUXC_NAND_DATA03_GPIO3_IO9 |
| 16 || B6| GPIO5_IO24(GPIO5) |UART2_RXD  | IO  | MX8MQ_IOMUXC_UART2_RXD_GPIO5_IO24 |  
| 17 || | |NVCC_3V3  | Power |  
| 18 || D6| GPIO5_IO25(GPIO5) |UART2_TXD  | IO | MX8MQ_IOMUXC_UART2_TXD_GPIO5_IO25 |
| 19 || A4| GPIO5_IO07 | ECSPI1_MOSI / UART3_TXD  | IO |  
| 20 || | |GND  | Ground |  
| 21 || B4| GPIO5_IO08 | ECSPI1_MISO / UART3_CTS | IO |  
| 22 || K19| GPIO3_IO15 |  | IO |  
| 23 || D5| GPIO5_IO06 | ECSPI1_SCLK / UART3_RXD | IO |  
| 24 || H19| GPIO3_IO01 | ECSPI1_SS0 | IO |  
| 25 || | |GND  |  |  
| 26 || G21| GPIO3_IO02|  | IO |  
| 27 || E9| GPIO5_IO19(GPIO5) |I2C3_SDA  | IO | MX8MQ_IOMUXC_I2C3_SDA_GPIO5_IO19 |
| 28 || G8| GPIO5_IO18(GPIO5) |I2C3_SCL  | IO | MX8MQ_IOMUXC_I2C3_SCL_GPIO5_IO18 |
| 29 || H21| GPIO3_IO05 |  | IO |  
| 30 || | |GND  | Ground |  
| 31 || L20| GPIO3_IO10 |  | IO |  
| 32 || J6| GPIO1_IO15 |  | IO |  MX8MQ_IOMUXC_GPIO1_IO15_PWM4_OUT |
| 33 || K6| GPIO1_IO13 |  | IO |  MX8MQ_IOMUXC_GPIO1_IO13_PWM2_OUT |
| 34 || | |GND  | Ground |  
| 35 || J4| GPIO4_IO21(GPIO4) |SAI2_RXFS  |  |  
| 36 |3| P4| GPIO1_IO03 |   | IO |  
| 37 |75| J22| GPIO3_IO11 |  | IO | 
| 38 |119| J4| GPIO4_IO23(GPIO4) |SAI2_RXD  | IO | MX8MQ_IOMUXC_SAI2_RXD0_GPIO4_IO23 |
| 39 || | |GND  | Ground |  
| 40 |122| G5| GPIO4_IO26(GPIO4) |SAI2_TXD  | IO |  MX8MQ_IOMUXC_SAI2_TXD0_GPIO4_IO26 |

## How to calculate GPIO pin number: 

The GPIO pins could also be used, by calculating the gpio number as follows:
```
gpio_number = (chip_number -1) * 32 + gpio port
```
For example,
```
GPIO port 11 on gpio3 is: (3-1)*32 +11 = 75.
```
