import 'package:toplife/main_systems/system_shop_and_storage/constants/settlement.dart';

Settlement? getSettlementEnum(String settlementName) {
  final settlementsMap = Settlement.values.asNameMap();

  return settlementsMap[settlementName];
}
