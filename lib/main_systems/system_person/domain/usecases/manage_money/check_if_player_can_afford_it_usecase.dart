import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_location/util/get_country_economy_adjusted_price.dart';
import 'package:toplife/main_systems/system_person/domain/repository/person_repository.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/get/get_player_money_usecase.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';

class CheckIfPlayerCanAffordItUsecase {
  final GetPlayerMoneyUsecase _getPlayerMoneyUsecase;
  final PersonRepository _personRepository;

  const CheckIfPlayerCanAffordItUsecase({
    required GetPlayerMoneyUsecase getPlayerMoneyUsecase,
    required PersonRepository personRepository,
  })  : _getPlayerMoneyUsecase = getPlayerMoneyUsecase,
        _personRepository = personRepository;

  Future<bool> execute({
    required RelationshipUsecases relationshipUsecases,
    required int personID,
    required int basePrice,
    required bool adjustToEconomy,
  }) async {
    final Person? playerPerson = await _personRepository.getPerson(personID);
    final int playerMoney = await _getPlayerMoneyUsecase.execute(
      relationshipUsecases: relationshipUsecases,
      mainPlayerID: personID,
    );

    late final int finalPrice;
    if (adjustToEconomy) {
      finalPrice = getCountryEconomyAdjustedPrice(
        country: playerPerson?.currentCountry ?? "",
        basePrice: basePrice,
      );
    } else {
      finalPrice = basePrice;
    }

    return playerMoney >= finalPrice;
  }
}
