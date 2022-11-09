import 'package:toplife/main_systems/system_location/countries/country.dart';
import 'package:toplife/main_systems/system_location/location_manager.dart';
import 'package:toplife/main_systems/system_person/data/repository/person_repositories.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_relationship/constants/partner_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/partner.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';

class TakeMoneyFromPlayerUsecase {
  final PersonRepositories _personRepositories;
  final RelationshipUsecases _relationshipUsecases;

  const TakeMoneyFromPlayerUsecase(
      {required PersonRepositories personRepositories,
      required RelationshipUsecases relationshipUsecases})
      : _personRepositories = personRepositories,
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
        countryName: mainPlayerPerson.country,
      );

      late final int finalAmountToTake;
      if (adjustToEconomy) {
        finalAmountToTake = baseAmountToTake * playerCountry.economy;
      } else {
        finalAmountToTake = baseAmountToTake;
      }

      //check if player is married
      final currentPartner = await _relationshipUsecases
          .getCurrentPartnerUsecase
          .execute(mainPlayerID);

      //player is married
      if (currentPartner != null &&
          currentPartner.partnerRelationshipType ==
              PartnerRelationshipType.married.name) {
        return takeMoneyFromMarriedPlayer(
          mainPlayerPerson: mainPlayerPerson,
          amountToTake: finalAmountToTake,
          currentPartner: currentPartner,
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
    required Partner currentPartner,
  }) async {
    final partnerPerson =
        await _personRepositories.personRepositoryImpl.getPerson(
      currentPartner.partnerID,
    );

    if (partnerPerson != null) {
      final int playerAccount = mainPlayerPerson.money;
      final int partnerAccount = partnerPerson.money;
      final int jointAccount = currentPartner.jointMoney;

      //if they can afford it
      if ((playerAccount + partnerAccount + jointAccount) >= amountToTake) {
        int amountRemaining = amountToTake;

        if (jointAccount >= amountRemaining) {
          //joint account has enough money
          await _relationshipUsecases.updatePartnerRelationshipUsecase.execute(
            currentPartner.copyWith(
              jointMoney: (jointAccount - amountRemaining),
            ),
          );
          return true;
        }
        //joint account doesnt have enough money
        else {
          //take whatever is in joint account
          await _relationshipUsecases.updatePartnerRelationshipUsecase.execute(
            currentPartner.copyWith(
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
              partnerPerson.copyWith(
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
              partnerPerson.copyWith(
                money: (partnerAccount - amountRemaining),
              ),
            );

            return true;
          }
          //player can pay but partner can't afford to pay
          else {
            //take whatever the partner has
            await _personRepositories.personRepositoryImpl.updatePerson(
              partnerPerson.copyWith(
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
