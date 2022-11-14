import 'package:toplife/main_systems/system_relationship/constants/partner_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/romantic/create_exclusive_romantic_relationship_usecase.dart';

class GetMarriedUsecase {
  final CreateExclusiveRomanticRelationshipUsecase
      _createExclusiveRomanticRelationshipUsecase;

  const GetMarriedUsecase({
    required CreateExclusiveRomanticRelationshipUsecase
        createExclusiveRomanticRelationshipUsecase,
  }) : _createExclusiveRomanticRelationshipUsecase =
            createExclusiveRomanticRelationshipUsecase;

  Future<void> execute({
    required int mainPersonID,
    required int partnerID,
    required int currentDay,
  }) async {
    //create marriage relationships from both point of views
    _createExclusiveRomanticRelationshipUsecase.execute(
      mainPersonID: mainPersonID,
      partnerID: partnerID,
      partnerRelationshipType: PartnerRelationshipType.married,
      currentDay: currentDay,
    );
  }
}
