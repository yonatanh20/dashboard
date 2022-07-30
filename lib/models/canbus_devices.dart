import 'package:dashboard/providers/complex-provider.dart';
import 'package:dashboard/providers/single-provider.dart';

enum Channel { can0, can1, unkown }

class CanBusDevice {
  final Map<int, void Function(Channel, int, List<int>)> actions;

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
      (defaultProviders[ErrorState] as ErrorState)
          .updateData(data.length >= 1 ? data[0] : 777);
    },
    0x101: (Channel channel, int id, List<int> data) {
      (defaultProviders[DrivingState] as DrivingState).updateData(0);
    },
    0x102: (Channel channel, int id, List<int> data) {
      (defaultProviders[DrivingState] as DrivingState).updateData(1);
    },
    0x103: (Channel channel, int id, List<int> data) {
      (defaultProviders[DrivingState] as DrivingState).updateData(2);
    },
    0x104: (Channel channel, int id, List<int> data) {
      (defaultProviders[DrivingState] as DrivingState).updateData(3);
    },
  });
  static final CanBusDevice inverterLeft = CanBusDevice(actions: {
    0x182: (Channel channel, int id, List<int> data) {
      if (channel == Channel.can1) return;
      switch (data[0]) {
        case 0x30:
          (defaultProviders[SpeedometerProvider] as SpeedometerProvider)
              .updateData(
                  SpeedometerKeys.inverterLRPM, (data[2] << 8) + data[1]);
          break;
        case 0x49:
          (defaultProviders[MotorLTemp] as MotorLTemp)
              .updateData((data[2] << 8) + data[1]);
          //CanConnection.sendFrame(channel: Channel.can1, id: id, data: data);
          break;
        case 0x4A:
          (defaultProviders[InverterLTemp] as InverterLTemp)
              .updateData((data[2] << 8) + data[1]);
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
          (defaultProviders[SpeedometerProvider] as SpeedometerProvider)
              .updateData(
                  SpeedometerKeys.inverterRRPM, (data[2] << 8) + data[1]);
          break;
        case 0x49:
          (defaultProviders[MotorRTemp] as MotorRTemp)
              .updateData((data[2] << 8) + data[1]);
          //CanConnection.sendFrame(channel: Channel.can1, id: id, data: data);
          break;
        case 0x4A:
          (defaultProviders[InverterRTemp] as InverterRTemp)
              .updateData((data[2] << 8) + data[1]);
          //CanConnection.sendFrame(channel: Channel.can1, id: id, data: data);
          break;
        default:
      }
    }
  });
  static final CanBusDevice driverNode = CanBusDevice(actions: {
    0x50: (Channel channel, int id, List<int> data) {
      if (channel == Channel.can1) return;
      (defaultProviders[HeatEvac] as HeatEvac).updateData(data[1]);
      //CanConnection.sendFrame(channel: Channel.can1, id: id, data: data);
    },
  });
  static final CanBusDevice pedal = CanBusDevice(actions: {
    0x30: (Channel channel, int id, List<int> data) {
      (defaultProviders[SpeedometerProvider] as SpeedometerProvider)
          .updateData(SpeedometerKeys.gas, (data[0] << 8) + data[1]);
      (defaultProviders[SpeedometerProvider] as SpeedometerProvider)
          .updateData(SpeedometerKeys.breaking, (data[2] << 8) + data[3]);
      (defaultProviders[SteeringAngle] as SteeringAngle)
          .updateData((data[4] << 8) + data[5]);
      (defaultProviders[OilPressure] as OilPressure)
          .updateData((data[6] << 8) + data[7]);
    },
  });
  static final CanBusDevice bms = CanBusDevice(actions: {
    0x133: (Channel channel, int id, List<int> data) {
      (defaultProviders[StateOfCharge] as StateOfCharge)
          .updateData((data[0] << 8) + data[1]);
    }
  });
  static final CanBusDevice lv = CanBusDevice(actions: {
    0x148: (Channel channel, int id, List<int> data) {
      (defaultProviders[ShutdownState] as ShutdownState).updateData(data[0]);
    }
  });
  static final CanBusDevice imu = CanBusDevice(
      actions: {0x570: (Channel channel, int id, List<int> data) {}});
  static final CanBusDevice hv = CanBusDevice(
      actions: {0x900: (Channel channel, int id, List<int> data) {}});
}
