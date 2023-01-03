import 'package:toplife/main_systems/system_location/util/get_country_economy_adjusted_price.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/get/get_player_money_usecase.dart';

class CheckIfPlayerCanAffordItUsecase {
  final GetPlayerMoneyUsecase _getPlayerMoneyUsecase;
  const CheckIfPlayerCanAffordItUsecase(
      {required GetPlayerMoneyUsecase getPlayerMoneyUsecase})
      : _getPlayerMoneyUsecase = getPlayerMoneyUsecase;

  Future<bool> execute({
    required int personID,
    required int basePrice,
    required String country,
    required bool adjustToEconomy,
  }) async {
    final int playerMoney = await _getPlayerMoneyUsecase.execute(
      mainPlayerID: personID,
    );

    late final int finalPrice;
    if (adjustToEconomy) {
      finalPrice = getCountryEconomyAdjustedPrice(
        country: country,
        basePrice: basePrice,
      );
    } else {
      finalPrice = basePrice;
    }

    return playerMoney >= finalPrice;
  }
}
