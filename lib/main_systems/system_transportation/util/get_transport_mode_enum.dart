import 'package:toplife/main_systems/system_transportation/constants/transport_mode.dart';

TransportMode? getTransportModeEnum(String transportModeName) {
  final transportModesMap = TransportMode.values.asNameMap();

  return transportModesMap[transportModeName];
}
