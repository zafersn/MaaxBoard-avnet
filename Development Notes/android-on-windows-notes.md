## This notes have been written considering maaxboard dev board based on IMX8MQ-EVK

CONTENT-LIST
=================
<!--ts-->
  * [ To install an apk by using adb](#to-install-an-apk-by-using-adb)
  * [ To find where adb shell installed](#to-find-where-adb-shell-installed)
  * [ To Get files from the android device by adb](#to-get-files-from-the-android-device-by-adb)
  * [ To get File list on the android by adb](#to-get-file-list-on-the-android-by-adb)
  * [ To Get screenshot](#to-get-screenshot)
 <!-- * [ To Print function name using by macro](#print-function-name-using-by-macro)
  * [ To Print current computer time by macro](#to-print-current-computer-time-by-macro)
  * [ To see dtb file located path](#)
  * [ To see dtb file located path](#)-->
  
<!--te-->

### **To install an apk by using adb**

you need to install an app on your custom android device/Maaxboard? it is easy, download your apk file and use this adb command to install it on your device.

```bash
.\adb.exe install C:\Users\zsen_\OneDrive\Desktop\MaaxBoard\filename.apk
```

### **To find where adb shell installed**
the easiest way to have adb shell, you need to install android studio basically.
Default way for adb on the windowsOS
```bash
C:\Users\zsen_\AppData\Local\Android\Sdk\platform-tools
```

### **To Get files from the android device by adb**
get file picture1233.png to the C:\Users\zsen_\OneDrive\Desktop\MaaxBoard\Android\pull_files folder

```bash
.\adb.exe pull /storage/emulated/0/Pictures/Screenshots/picture1233.png C:\Users\zsen_\OneDrive\Desktop\MaaxBoard\Android\pull_files
```
### **To get File list on the android by adb**

execute this command to get file list in the folder:  

```bash
.\adb.exe shell ls /storage/emulated/0/Pictures/Screenshots

 ```
### **To Get screenshot**

i.e. define a filepath/filename.png

```
.\adb.exe shell screencap  /storage/emulated/0/Pictures/Screenshots/ss_memory.png

```
<!-- 
### **To Print current computer time by macro**

i.e. we have a function call ex5_simple_module_function

```
void printfTime()
{
  printf("Inside the %s function\n",__TIME__);
}
```

#

## Random note, might be helpful, check them out: 

to create a yocto file system from scratch. Watch this episode https://www.youtube.com/watch?v=2-PwskQrZac&list=PLEBQazB0HUyTpoJoZecRK6PpDG31Y7RPB&index=3

so I need to get ride of heavy yocto files/ plugins such as opencv, qt etc. you need to edit lite-image, bblayer in conf

try this code block

bitbake -c menuconfig virtual/kernel -->
