# Ben-Gurion's Digital dashboard

A graphical inteface for displaying our racecar's live stats.
The app was build with Flutter on a Raspberry Pi 4B and designed to work with waveshare's [CAN hat](https://www.waveshare.com/wiki/2-CH_CAN_HAT).
The app is devided into 2 main treads, the main is the flutter app that controls the GUI, and the secondary controls the CAN bus communication.


## Dev Enviorment and Raspberry Pi setup
* [Enable CAN virtualization withing WSL2](https://gist.github.com/yonatanh20/664f07d62eb028db18aa98b00afae5a6) for developement on Windows. 
* [Flutter-PI by ardera](https://github.com/ardera/flutter-pi) to enable running the flutter app on the rasperry pi.


## Flutter Dependencies
* [Syncfusion Flutter Gauges](https://pub.dev/packages/syncfusion_flutter_gauges)
* [Objectbox](https://pub.dev/packages/objectbox)
## Linux Dependencies
* [SocketCan](https://github.com/linux-can/can-utils)
