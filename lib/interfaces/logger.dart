import 'dart:collection';

import '../models/utils.dart';
import '/interfaces/canbus.dart';
import '/models/canbus_devices.dart';

class CanBusData {
  static final CanConnection canConnection0 =
      CanConnection(channel: Channel.can0);
  static final CanConnection canConnection1 =
      CanConnection(channel: Channel.can1);
  static final Map<int, Function(Channel, int, List<int>)> deviceCallbacks =
      HashMap();
  static String deviceName = 'Unkown Device';
  static String desc = '';

  static void start() async {
    //Register functions
    for (var device in CanBusDevice.devices) {
      deviceCallbacks.addAll(device.actions);
    }
    await canConnection0.setOutput();
    await canConnection1.setOutput();
    (await canConnection0.input).listen((line) {
      parseLine(Channel.can0, line);
    });
    (await canConnection1.input).listen((line) {
      parseLine(Channel.can1, line);
    });
  }

  static void parseLine(Channel channel, String line) {
    if (!line.startsWith("(")) {
      return;
    }
    List<String> lineArgs = line.split("#");
    lineArgs = [...lineArgs[0].split(" "), lineArgs[1]];
    var channel = Channel.can0.toShortString() == lineArgs[1]
        ? Channel.can0
        : Channel.can1.toShortString() == lineArgs[1]
            ? Channel.can1
            : Channel.unkown;
    var pid = int.tryParse(lineArgs[2], radix: 16) ?? 777;
    List<int> data = [];
    for (int i = 0; i < lineArgs[3].length; i += 2) {
      data.add(int.tryParse(lineArgs[3].substring(i, i + 2), radix: 16) ?? 0);
    }
    deviceCallbacks[pid]?.call(channel, pid, data);
  }

  static Future<void> close() async {
    canConnection0.close();
    canConnection1.close();
  }
}
