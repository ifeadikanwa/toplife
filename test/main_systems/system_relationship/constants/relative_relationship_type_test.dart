// ignore_for_file: unnecessary_type_check

import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_relationship/constants/relative_relationship_type.dart';

void main() {
  group("Relative Relationship Type:", () {
    test("grandchild is a type of relative relationship", () {
      assert(RelativeRelationshipType.grandchild is RelativeRelationshipType);
    });

    test("nibling is a type of relative relationship", () {
      assert(RelativeRelationshipType.nibling is RelativeRelationshipType);
    });
  });
}
