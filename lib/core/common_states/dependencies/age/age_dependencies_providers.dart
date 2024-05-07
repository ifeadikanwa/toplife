import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/game_systems/main_systems/system_age/usecases/age_usecases.dart';

part 'age_dependencies_providers.g.dart';

@riverpod
AgeUsecases ageUsecases(AgeUsecasesRef ref) {
  return AgeUsecases(ref: ref);
}
