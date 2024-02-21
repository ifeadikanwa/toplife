import 'package:toplife/main_systems/system_shop_and_storage/constants/settlement.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_transportation/constants/driving_mode.dart';
import 'package:toplife/main_systems/system_transportation/constants/transport_mode.dart';
import 'package:toplife/main_systems/system_transportation/public_transportation/public_transportation.dart';

class TransportationDefault {
  static final Car car = PublicTransportation.bus;

  static const TransportMode transportMode = TransportMode.bus;

  static const DrivingMode drivingMode = DrivingMode.normal;

  static const Settlement travellerSettlement = Settlement.City;

  static const Settlement destinationSettlement = Settlement.City;
}
