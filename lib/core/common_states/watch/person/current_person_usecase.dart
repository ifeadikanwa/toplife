import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

final currentPersonProvider =
    StreamProvider.family.autoDispose<Person?, int>((ref, personID) async* {
  //get stream
  final Stream<Person?> personStream =
      ref.watch(personUsecasesProvider).watchPersonUsecase.execute(
            personID: personID,
          );

  //yield result
  await for (var person in personStream) {
    yield person;
  }
});
