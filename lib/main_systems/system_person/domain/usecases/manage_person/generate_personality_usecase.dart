import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/util/personality_utils.dart';

class GeneratePersonalityUsecase {
  Personality execute({
    required int personID,
  }) {
    return Personality(
      personId: personID,
      forgiving: PersonalityUtils.getValidPersonalityValue(),
      responsible: PersonalityUtils.getValidPersonalityValue(),
      generous: PersonalityUtils.getValidPersonalityValue(),
      libido: PersonalityUtils.getValidPersonalityValue(),
      polite: PersonalityUtils.getValidPersonalityValue(),
      confrontational: PersonalityUtils.getValidPersonalityValue(),
      rebellious: PersonalityUtils.getValidPersonalityValue(),
      impulsive: PersonalityUtils.getValidPersonalityValue(),
      loyal: PersonalityUtils.getValidPersonalityValue(),
      violent: PersonalityUtils.getValidPersonalityValue(),
    );
  }
}
