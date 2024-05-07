import 'package:toplife/game_systems/main_systems/system_location/countries/country.dart';
import 'package:toplife/game_systems/main_systems/system_location/location_manager.dart';
import 'package:toplife/game_systems/main_systems/system_person/data/repository/person_repositories.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/model/info_models/person_id_pair.dart';
import 'package:toplife/game_systems/main_systems/system_person/util/get_unknown_id_from_person_id_pair.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';

class TakeMoneyFromPlayerUsecase {
  final PersonRepositories _personRepositories;
  final RelationshipUsecases _relationshipUsecases;

  const TakeMoneyFromPlayerUsecase({
    required PersonRepositories personRepositories,
    required RelationshipUsecases relationshipUsecases,
  })  : _personRepositories = personRepositories,
        _relationshipUsecases = relationshipUsecases;

  Future<bool> execute({
    required int mainPlayerID,
    required int baseAmountToTake,
    required bool adjustToEconomy,
  }) async {
    //get player
    final Person? mainPlayerPerson =
        await _personRepositories.personRepositoryImpl.getPerson(
      mainPlayerID,
    );

    //if player is a valid person
    if (mainPlayerPerson != null) {
      //get player economy and adjust amount to take
      final Country playerCountry = LocationManager.getCountryClass(
        countryName: mainPlayerPerson.currentCountry,
      );

      late final int finalAmountToTake;
      if (adjustToEconomy) {
        finalAmountToTake = baseAmountToTake * playerCountry.economy;
      } else {
        finalAmountToTake = baseAmountToTake;
      }

      //check if player is married
      final currentMarriageRelationship = await _relationshipUsecases
          .getMarriagePartnerRelationshipUsecase
          .execute(personID: mainPlayerID);

      //player is married
      if (currentMarriageRelationship != null) {
        return takeMoneyFromMarriedPlayer(
          mainPlayerPerson: mainPlayerPerson,
          amountToTake: finalAmountToTake,
          relationship: currentMarriageRelationship,
        );
      }
      //player is not married
      else {
        return takeMoneyFromUnmarriedPlayer(
          mainPlayerPerson: mainPlayerPerson,
          amountToTake: finalAmountToTake,
        );
      }
    }

    //player is not a valid person
    return false;
  }

  Future<bool> takeMoneyFromMarriedPlayer({
    required Person mainPlayerPerson,
    required int amountToTake,
    required Relationship relationship,
  }) async {
    final int spouseID = getUnkownIdFromPersonIdPair(
      personIdPair: PersonIdPair(
        firstId: relationship.firstPersonId,
        secondId: relationship.secondPersonId,
      ),
      knownId: mainPlayerPerson.id,
    );

    final spousePerson =
        await _personRepositories.personRepositoryImpl.getPerson(
      spouseID,
    );

    if (spousePerson != null) {
      final int playerAccount = mainPlayerPerson.money;
      final int partnerAccount = spousePerson.money;
      final int jointAccount = relationship.jointMoney;

      //if they can afford it
      if ((playerAccount + partnerAccount + jointAccount) >= amountToTake) {
        int amountRemaining = amountToTake;

        if (jointAccount >= amountRemaining) {
          //joint account has enough money
          await _relationshipUsecases.updateRelationshipUsecase.execute(
            relationship: relationship.copyWith(
              jointMoney: (jointAccount - amountRemaining),
            ),
          );
          return true;
        }
        //joint account doesnt have enough money
        else {
          //take whatever is in joint account
          await _relationshipUsecases.updateRelationshipUsecase.execute(
            relationship: relationship.copyWith(
              jointMoney: 0,
            ),
          );

          amountRemaining = amountRemaining - jointAccount;

          //take remaining payment from personal accounts:

          //they can both afford to pay half
          if (playerAccount >= (amountRemaining / 2) &&
              partnerAccount >= (amountRemaining / 2)) {
            await _personRepositories.personRepositoryImpl.updatePerson(
              mainPlayerPerson.copyWith(
                money: playerAccount - (amountRemaining / 2).ceil(),
              ),
            );

            amountRemaining = amountRemaining - (amountRemaining / 2).ceil();

            await _personRepositories.personRepositoryImpl.updatePerson(
              spousePerson.copyWith(
                money: (partnerAccount - amountRemaining),
              ),
            );

            return true;
          }

          //partner can pay but player can't afford to pay
          else if (partnerAccount >= (amountRemaining / 2)) {
            //take whatever the player has
            await _personRepositories.personRepositoryImpl.updatePerson(
              mainPlayerPerson.copyWith(
                money: 0,
              ),
            );

            amountRemaining = amountRemaining - playerAccount;

            await _personRepositories.personRepositoryImpl.updatePerson(
              spousePerson.copyWith(
                money: (partnerAccount - amountRemaining),
              ),
            );

            return true;
          }
          //player can pay but partner can't afford to pay
          else {
            //take whatever the partner has
            await _personRepositories.personRepositoryImpl.updatePerson(
              spousePerson.copyWith(
                money: 0,
              ),
            );

            amountRemaining = amountRemaining - partnerAccount;

            await _personRepositories.personRepositoryImpl.updatePerson(
              mainPlayerPerson.copyWith(
                money: (playerAccount - amountRemaining),
              ),
            );

            return true;
          }
        }
      }
    }

    return false;
  }

  Future<bool> takeMoneyFromUnmarriedPlayer({
    required Person mainPlayerPerson,
    required int amountToTake,
  }) async {
    final int playerAccount = mainPlayerPerson.money;

    if (playerAccount >= amountToTake) {
      await _personRepositories.personRepositoryImpl.updatePerson(
        mainPlayerPerson.copyWith(
          money: (playerAccount - amountToTake),
        ),
      );

      return true;
    }

    return false;
  }
}
