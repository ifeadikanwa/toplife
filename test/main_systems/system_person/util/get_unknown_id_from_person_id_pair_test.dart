import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_id_pair.dart';
import 'package:toplife/main_systems/system_person/util/get_unknown_id_from_person_id_pair.dart';

void main() {
  group("Get the unknown id from person id pair:", () {
    const int firstId = 3;
    const int secondId = 8;

    const PersonIdPair personIdPair = PersonIdPair(
      firstId: firstId,
      secondId: secondId,
    );

    test('when the first id in the pair is known, we get the second id', () {
      expect(
        getUnkownIdFromPersonIdPair(
          personIdPair: personIdPair,
          knownId: firstId,
        ),
        secondId,
      );
    });

    test('when the second id in the pair is known, we get the first id', () {
      expect(
        getUnkownIdFromPersonIdPair(
          personIdPair: personIdPair,
          knownId: secondId,
        ),
        firstId,
      );
    });

    test(
        'when the known id is not equal to the first or second id, we get the first id',
        () {
      const idWithNoMatch = 55;

      expect(
        getUnkownIdFromPersonIdPair(
          personIdPair: personIdPair,
          knownId: idWithNoMatch,
        ),
        firstId,
      );
    });
  });
}
