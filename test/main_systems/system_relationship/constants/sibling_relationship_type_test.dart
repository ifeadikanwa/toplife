// ignore_for_file: unnecessary_type_check

import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_relationship/constants/sibling_relationship_type.dart';

void main() {
  group("Sibling Relationship Types Constants:", () {
    test("full is a type of sibling relationship", () {
      assert(SiblingRelationshipType.full is SiblingRelationshipType);
    });

    test("half is a type of sibling relationship", () {
      assert(SiblingRelationshipType.half is SiblingRelationshipType);
    });

    test(
      "step is a type of sibling relationship",
      (){
        assert(SiblingRelationshipType.step is SiblingRelationshipType);
      }
    );
  });
}
