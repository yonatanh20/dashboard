import 'package:dashboard/providers/frame-provider.dart';

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
      FrameData.defaultFrame.errorState = data.length == 1 ? data[0] : 777;
    },
    0x101: (Channel channel, int id, List<int> data) {
      FrameData.defaultFrame.drivingState = 0;
    },
    0x102: (Channel channel, int id, List<int> data) {
      FrameData.defaultFrame.drivingState = 1;
    },
    0x103: (Channel channel, int id, List<int> data) {
      FrameData.defaultFrame.drivingState = 2;
    },
    0x104: (Channel channel, int id, List<int> data) {
      FrameData.defaultFrame.drivingState = 3;
    },
  });
  static final CanBusDevice inverterLeft = CanBusDevice(actions: {
    0x182: (Channel channel, int id, List<int> data) {
      if (channel == Channel.can1) return;
      switch (data[0]) {
        case 0x30:
          FrameData.defaultFrame.inverterLRPM = (data[2] << 8) + data[1];
          break;
        case 0x49:
          FrameData.defaultFrame.inverterLMotorTemp = (data[2] << 8) + data[1];
          //CanConnection.sendFrame(channel: Channel.can1, id: id, data: data);
          break;
        case 0x4A:
          FrameData.defaultFrame.inverterLTemp = (data[2] << 8) + data[1];
          //CanConnection.sendFrame(channel: Channel.can1, id: id, data: data);
          break;
        default:
      }
    }
  });
  static final CanBusDevice inverterRight = CanBusDevice(actions: {
    0x181: (Channel channel, int id, List<int> data) {
      if (channel == Channel.can1) return;
      switch (data[0]) {
        case 0x30:
          FrameData.defaultFrame.inverterRRPM = (data[2] << 8) + data[1];
          break;
        case 0x49:
          FrameData.defaultFrame.inverterRMotorTemp = (data[2] << 8) + data[1];
          //CanConnection.sendFrame(channel: Channel.can1, id: id, data: data);
          break;
        case 0x4A:
          FrameData.defaultFrame.inverterRTemp = (data[2] << 8) + data[1];
          //CanConnection.sendFrame(channel: Channel.can1, id: id, data: data);
          break;
        default:
      }
    }
  });
  static final CanBusDevice driverNode = CanBusDevice(actions: {
    0x50: (Channel channel, int id, List<int> data) {
      if (channel == Channel.can1) return;
      FrameData.defaultFrame.heatEvac = data[1];
      //CanConnection.sendFrame(channel: Channel.can1, id: id, data: data);
    },
  });
  static final CanBusDevice pedal = CanBusDevice(actions: {
    0x30: (Channel channel, int id, List<int> data) {
      FrameData.defaultFrame.gas = (data[0] << 8) + data[1];
      FrameData.defaultFrame.breaking = (data[2] << 8) + data[3];
      FrameData.defaultFrame.steeringAngle = (data[4] << 8) + data[5];
      FrameData.defaultFrame.oilPressure = (data[6] << 8) + data[7];
    },
  });
  static final CanBusDevice bms = CanBusDevice(actions: {
    0x133: (Channel channel, int id, List<int> data) {
      FrameData.defaultFrame.stateOfCharge = (data[0] << 8) + data[1];
    }
  });
  static final CanBusDevice lv = CanBusDevice(actions: {
    0x148: (Channel channel, int id, List<int> data) {
      FrameData.defaultFrame.shutdown = data[0];
    }
  });
  static final CanBusDevice imu = CanBusDevice(
      actions: {0x570: (Channel channel, int id, List<int> data) {}});
  static final CanBusDevice hv = CanBusDevice(
      actions: {0x900: (Channel channel, int id, List<int> data) {}});
}
