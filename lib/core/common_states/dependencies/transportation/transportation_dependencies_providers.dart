import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/transportation_usecases.dart';

part 'transportation_dependencies_providers.g.dart';

@riverpod
TransportationUsecases transportationUsecases(TransportationUsecasesRef ref) {
  return TransportationUsecases(ref: ref);
}
