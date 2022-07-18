import 'package:dashboard/interfaces/canbus.dart';
import 'package:dashboard/providers/frame-provider.dart';

import '../interfaces/logger.dart';

enum Channel { can0, can1, unkown }

class CanBusDevice {
  final Map<int, Function(Channel, int, List<int>)> actions;

  CanBusDevice({required this.actions});
  static final List<CanBusDevice> devices = [
    ecu,
    inverterLeft,
    inverterRight,
    driverNode,
    pedal,
    imu,
    bms,
    lv,
    hv
  ];

  static final CanBusDevice ecu = CanBusDevice(actions: {
    0x20: (Channel channel, int id, List<int> data) {
      CanBusData.frameData.errorState = data.length == 1 ? data[0] : 777;
    },
    0x101: (Channel channel, int id, List<int> data) {
      CanBusData.frameData.drivingState = 0;
    },
    0x102: (Channel channel, int id, List<int> data) {
      CanBusData.frameData.drivingState = 1;
    },
    0x103: (Channel channel, int id, List<int> data) {
      CanBusData.frameData.drivingState = 2;
    },
    0x104: (Channel channel, int id, List<int> data) {
      CanBusData.frameData.drivingState = 3;
    },
  });
  static final CanBusDevice inverterLeft = CanBusDevice(actions: {
    0x182: (Channel channel, int id, List<int> data) {
      switch (data[0]) {
        case 0x30:
          CanBusData.frameData.inverterLRPM = (data[2] << 8) + data[1];
          break;
        case 0x49:
          CanBusData.frameData.inverterLMotorTemp = (data[2] << 8) + data[1];
          CanConnection.sendFrame(channel: Channel.can1, id: id, data: data);
          break;
        case 0x4A:
          CanBusData.frameData.inverterLTemp = (data[2] << 8) + data[1];
          CanConnection.sendFrame(channel: Channel.can1, id: id, data: data);
          break;
        default:
      }
    }
  });
  static final CanBusDevice inverterRight = CanBusDevice(actions: {
    0x181: (Channel channel, int id, List<int> data) {
      switch (data[0]) {
        case 0x30:
          CanBusData.frameData.inverterRRPM = (data[2] << 8) + data[1];
          break;
        case 0x49:
          CanBusData.frameData.inverterRMotorTemp = (data[2] << 8) + data[1];
          CanConnection.sendFrame(channel: Channel.can1, id: id, data: data);
          break;
        case 0x4A:
          CanBusData.frameData.inverterRTemp = (data[2] << 8) + data[1];
          CanConnection.sendFrame(channel: Channel.can1, id: id, data: data);
          break;
        default:
      }
    }
  });
  static final CanBusDevice driverNode = CanBusDevice(actions: {
    0x50: (Channel channel, int id, List<int> data) {
      CanBusData.frameData.heatEvac = data[1];
      CanConnection.sendFrame(channel: Channel.can1, id: id, data: data);
    },
  });
  static final CanBusDevice pedal = CanBusDevice(actions: {
    0x30: (Channel channel, int id, List<int> data) {
      CanBusData.frameData.gas = (data[0] << 8) + data[1];
      CanBusData.frameData.breaking = (data[2] << 8) + data[3];
      CanBusData.frameData.steeringAngle = (data[4] << 8) + data[5];
      CanBusData.frameData.oilPressure = (data[6] << 8) + data[7];
    },
  });
  static final CanBusDevice bms = CanBusDevice(
      actions: {0x133: (Channel channel, int id, List<int> data) {}});
  static final CanBusDevice lv = CanBusDevice(
      actions: {0x252: (Channel channel, int id, List<int> data) {}});
  static final CanBusDevice imu = CanBusDevice(
      actions: {0x570: (Channel channel, int id, List<int> data) {}});
  static final CanBusDevice hv = CanBusDevice(
      actions: {0x900: (Channel channel, int id, List<int> data) {}});
}
