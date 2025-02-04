import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/settlement.dart';

Settlement? getSettlementEnum(String settlementName) {
  final settlementsMap = Settlement.values.asNameMap();

  return settlementsMap[settlementName];
}
