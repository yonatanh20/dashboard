import 'package:dashboard/models/canbus_devices.dart';

extension ParseToString on Channel {
  String toShortString() {
    return toString().split('.').last;
  }
}
