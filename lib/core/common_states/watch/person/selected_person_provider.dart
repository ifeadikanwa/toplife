import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

part 'selected_person_provider.g.dart';

//automatically disposed
@riverpod
Stream<Person?> selectedPerson(
  SelectedPersonRef ref, {
  required int personID,
}) async* {
  //get stream
  final Stream<Person?> personStream =
      ref.watch(personUsecasesProvider).watchPersonUsecase.execute(
            personID: personID,
          );

  //yield result
  await for (var person in personStream) {
    yield person;
  }
}
