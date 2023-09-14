import 'package:toplife/main_systems/system_location/countries/country.dart';
import 'package:toplife/main_systems/system_location/location_manager.dart';
import 'package:toplife/main_systems/system_person/data/repository/person_repositories.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/constants/partner_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';

class AddMoneyToPlayerUsecase {
  final PersonRepositories _personRepositories;
  final RelationshipUsecases _relationshipUsecases;

  const AddMoneyToPlayerUsecase({
    required PersonRepositories personRepositories,
    required RelationshipUsecases relationshipUsecases,
  })  : _personRepositories = personRepositories,
        _relationshipUsecases = relationshipUsecases;

  Future<void> execute({
    required int mainPlayerID,
    required int baseAmountToAdd,
    required bool adjustToEconomy,
  }) async {
    //get player
    final Person? mainPlayerPerson =
        await _personRepositories.personRepositoryImpl.getPerson(
      mainPlayerID,
    );
    //get partner
    final currentPartner = await _relationshipUsecases.getCurrentPartnerUsecase
        .execute(mainPlayerID);

    //if player is valid
    if (mainPlayerPerson != null) {
      //get player economy and adjust amount to add
      final Country playerCountry = LocationManager.getCountryClass(
        countryName: mainPlayerPerson.currentCountry,
      );

      late final int finalAmountToAdd;
      if (adjustToEconomy) {
        finalAmountToAdd = baseAmountToAdd * playerCountry.economy;
      } else {
        finalAmountToAdd = baseAmountToAdd;
      }

      //player is married
      if (currentPartner != null &&
          currentPartner.partnerRelationshipType ==
              PartnerRelationshipType.married.name) {
        return addMoneyToMarriedPlayer(
          amountToAdd: finalAmountToAdd,
          currentPartner: currentPartner,
        );
      }
      //player is not married
      else {
        return addMoneyToUnmarriedPlayer(
          mainPlayerPerson: mainPlayerPerson,
          amountToAdd: finalAmountToAdd,
        );
      }
    }
  }

  Future<void> addMoneyToMarriedPlayer({
    required int amountToAdd,
    required Partner currentPartner,
  }) async {
    //add to joint account

    final int oldJointMoney = currentPartner.jointMoney;

    await _relationshipUsecases.updatePartnerRelationshipUsecase.execute(
      currentPartner.copyWith(
        jointMoney: (oldJointMoney + amountToAdd),
      ),
    );
  }

  Future<void> addMoneyToUnmarriedPlayer({
    required Person mainPlayerPerson,
    required int amountToAdd,
  }) async {
    //add to player account
    final int oldPlayerMoney = mainPlayerPerson.money;

    await _personRepositories.personRepositoryImpl.updatePerson(
      mainPlayerPerson.copyWith(
        money: (oldPlayerMoney + amountToAdd),
      ),
    );
  }
}
