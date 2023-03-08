import 'package:toplife/main_systems/system_person/data/repository/person_repositories.dart';
import 'package:toplife/main_systems/system_relationship/constants/partner_relationship_type.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';

class GetPlayerMoneyUsecase {
  final PersonRepositories _personRepositories;

  const GetPlayerMoneyUsecase({
    required PersonRepositories personRepositories,
  }) : _personRepositories = personRepositories;

  Future<int> execute({
    required int mainPlayerID,
    required RelationshipUsecases relationshipUsecases,
  }) async {
    final currentPartner = await relationshipUsecases.getCurrentPartnerUsecase
        .execute(mainPlayerID);

    //player is married
    if (currentPartner != null &&
        currentPartner.partnerRelationshipType ==
            PartnerRelationshipType.married.name) {
      return getMarriedPlayerMoney(
        mainPlayerID: mainPlayerID,
        currentPartner: currentPartner,
      );
    }
    //player is not married
    else {
      return getUnmarriedPlayerMoney(
        mainPlayerID: mainPlayerID,
      );
    }
  }

  Future<int> getMarriedPlayerMoney({
    required int mainPlayerID,
    required Partner currentPartner,
  }) async {
    final mainPlayerPerson =
        await _personRepositories.personRepositoryImpl.getPerson(
      mainPlayerID,
    );
    final partnerPerson =
        await _personRepositories.personRepositoryImpl.getPerson(
      currentPartner.partnerId,
    );

    if (mainPlayerPerson != null && partnerPerson != null) {
      final int playerAccount = mainPlayerPerson.money;
      final int partnerAccount = partnerPerson.money;
      final int jointAccount = currentPartner.jointMoney;

      return playerAccount + partnerAccount + jointAccount;
    }

    return 0;
  }

  Future<int> getUnmarriedPlayerMoney({
    required int mainPlayerID,
  }) async {
    //add to player account

    final mainPlayerPerson =
        await _personRepositories.personRepositoryImpl.getPerson(
      mainPlayerID,
    );

    if (mainPlayerPerson != null) {
      return mainPlayerPerson.money;
    }

    return 0;
  }
}
