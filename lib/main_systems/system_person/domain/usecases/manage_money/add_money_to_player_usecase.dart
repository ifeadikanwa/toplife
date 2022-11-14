import 'package:toplife/main_systems/system_person/data/repository/person_repositories.dart';
import 'package:toplife/main_systems/system_relationship/constants/partner_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/partner.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';

class AddMoneyToPlayerUsecase {
  final PersonRepositories _personRepositories;
  final RelationshipUsecases _relationshipUsecases;

  const AddMoneyToPlayerUsecase(
      {required PersonRepositories personRepositories,
      required RelationshipUsecases relationshipUsecases})
      : _personRepositories = personRepositories,
        _relationshipUsecases = relationshipUsecases;

  Future<void> execute({
    required int mainPlayerID,
    required int amountToAdd,
  }) async {
    final currentPartner = await _relationshipUsecases.getCurrentPartnerUsecase
        .execute(mainPlayerID);

    //player is married
    if (currentPartner != null &&
        currentPartner.partnerRelationshipType ==
            PartnerRelationshipType.married.name) {
      return addMoneyToMarriedPlayer(
        mainPlayerID: mainPlayerID,
        amountToAdd: amountToAdd,
        currentPartner: currentPartner,
      );
    }
    //player is not married
    else {
      return addMoneyToUnmarriedPlayer(
        mainPlayerID: mainPlayerID,
        amountToAdd: amountToAdd,
      );
    }
  }

  Future<void> addMoneyToMarriedPlayer({
    required int mainPlayerID,
    required int amountToAdd,
    required Partner currentPartner,
  }) async {
    //add to joint account
    
    final int oldJointMoney = currentPartner.jointMoney;

    _relationshipUsecases.updatePartnerRelationshipUsecase.execute(
      currentPartner.copyWith(
        jointMoney: (oldJointMoney + amountToAdd),
      ),
    );
  }

  Future<void> addMoneyToUnmarriedPlayer({
    required int mainPlayerID,
    required int amountToAdd,
  }) async {
    //add to player account

    final mainPlayerPerson =
        await _personRepositories.personRepositoryImpl.getPerson(
      mainPlayerID,
    );

    if (mainPlayerPerson != null) {
      final int oldPlayerMoney = mainPlayerPerson.money;

      _personRepositories.personRepositoryImpl.updatePerson(
        mainPlayerPerson.copyWith(
          money: (oldPlayerMoney + amountToAdd),
        ),
      );
    }
  }
}
