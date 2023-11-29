import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/util/get_name_and_platonic_relationship_label.dart';

void main() {
  group('Get name and platonic relationship label:', () {
    test('we get the correct string', () {
      expect(
        getNameAndPlatonicRelationshipLabel(
          firstName: "firstName",
          lastName: "lastName",
          platonicRelationshipTypeList: [
            PlatonicRelationshipType.adoptiveParent,
            PlatonicRelationshipType.friend,
          ],
          genderString: Gender.Male.name,
          previousFamilialRelationship: PlatonicRelationshipType.grandCousin,
        ),
        "firstName lastName (Adoptive father/Friend, formerly Grandcousin)",
      );
    });
  });
}
