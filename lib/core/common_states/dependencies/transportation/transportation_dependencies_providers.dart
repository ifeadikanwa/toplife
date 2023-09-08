import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/journal/journal_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/core/common_states/dependencies/shop_and_storage/shop_and_storage_dependencies_providers.dart';
import 'package:toplife/main_systems/system_transportation/domain/usecases/transportation_usecases.dart';

final transportationUsecasesProvider = Provider<TransportationUsecases>((ref) {
  return TransportationUsecases(
    personUsecases: ref.watch(personUsecasesProvider),
    shopAndStorageUsecases: ref.watch(shopAndStorageUsecasesProvider),
    relationshipUsecases: ref.watch(relationshipUsecasesProvider),
    journalUsecases: ref.watch(journalUsecasesProvider),
  );
});
