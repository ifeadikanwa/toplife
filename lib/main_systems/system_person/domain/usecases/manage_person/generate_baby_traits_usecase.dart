import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/constants/baby_traits_constants.dart';

class GenerateBabyTraitsUsecase {
  BabyTraits execute({
    required int personID,
  }) {
    return BabyTraits(
      id: DatabaseConstants.dummyId,
      personId: personID,
      fussiness: BabyTraitsConstants.getValidFussinessValue(),
      appetite: BabyTraitsConstants.getValidAppetiteValue(),
      needsChanging: false,
    );
  }
}
