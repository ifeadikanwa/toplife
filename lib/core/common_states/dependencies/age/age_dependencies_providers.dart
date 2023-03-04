import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/main_systems/system_age/usecases/age_usecases.dart';

final ageUsecasesProvider = Provider<AgeUsecases>((ref) {
  return AgeUsecases();
});
