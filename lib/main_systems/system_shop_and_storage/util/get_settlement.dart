import 'package:toplife/main_systems/system_shop_and_storage/constants/settlement.dart';

Settlement? getSettlement(String settlementName) {
  final settlementsMap = Settlement.values.asNameMap();

  return settlementsMap[settlementName];
}
