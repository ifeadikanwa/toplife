import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_id_pair.dart';

final currentRelationshipProvider = StreamProvider.family
    .autoDispose<Relationship?, PersonIdPair>((ref, personIdPair) async* {
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
});
