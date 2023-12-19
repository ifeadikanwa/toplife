import 'package:toplife/main_systems/system_person/data/repository/person_repositories.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_id_pair.dart';
import 'package:toplife/main_systems/system_person/util/get_unknown_id_from_person_id_pair.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';

class GetPlayerMoneyUsecase {
  final PersonRepositories _personRepositories;
  final RelationshipUsecases _relationshipUsecases;

  const GetPlayerMoneyUsecase({
    required PersonRepositories personRepositories,
    required RelationshipUsecases relationshipUsecases,
  })  : _personRepositories = personRepositories,
        _relationshipUsecases = relationshipUsecases;

  Future<int> execute({
    required int mainPlayerID,
  }) async {
    final Relationship? currentMarriageRelationship = await _relationshipUsecases
        .getMarriagePartnerRelationshipUsecase
        .execute(personID: mainPlayerID);

    //player is married
    if (currentMarriageRelationship != null) {
      return getMarriedPlayerMoney(
        mainPlayerID: mainPlayerID,
        relationship: currentMarriageRelationship
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
    required Relationship relationship,
  }) async {
    final mainPlayerPerson =
        await _personRepositories.personRepositoryImpl.getPerson(
      mainPlayerID,
    );
    final int spouseID = getUnkownIdFromPersonIdPair(
      personIdPair: PersonIdPair(
        firstId: relationship.firstPersonId,
        secondId: relationship.secondPersonId,
      ),
      knownId: mainPlayerID,
    );
    final spousePerson =
        await _personRepositories.personRepositoryImpl.getPerson(spouseID);

    if (mainPlayerPerson != null && spousePerson != null) {
      final int playerAccount = mainPlayerPerson.money;
      final int partnerAccount = spousePerson.money;
      final int jointAccount = relationship.jointMoney;

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
