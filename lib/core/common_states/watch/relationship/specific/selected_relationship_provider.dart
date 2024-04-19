import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_id_pair.dart';

part 'selected_relationship_provider.g.dart';

@riverpod
Stream<Relationship?> selectedRelationship(
  SelectedRelationshipRef ref, {
  required PersonIdPair personIdPair,
}) async* {
  //get stream
  final Stream<Relationship?> relationshipStream =
      ref.watch(relationshipUsecasesProvider).watchRelationshipUsecase.execute(
            firstPersonId: personIdPair.firstId,
            secondPersonId: personIdPair.secondId,
          );

  //yield result
  await for (var relationship in relationshipStream) {
    yield relationship;
  }
}
