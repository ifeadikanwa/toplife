// ignore_for_file: unnecessary_type_check

import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_relationship/constants/existing_relationship_override_instruction.dart';

void main() {
  group("Existing relationship override instruction:", () {
    test("nothing is an existing relationship override instruction", () {
      assert(ExistingRelationshipOverrideInstruction.nothing
          is ExistingRelationshipOverrideInstruction);
    });

    test("everything is an existing relationship override instruction", () {
      assert(ExistingRelationshipOverrideInstruction.everything
          is ExistingRelationshipOverrideInstruction);
    });

    test("onlyPlatonicRelationshipType is an existing relationship override instruction", () {
      assert(ExistingRelationshipOverrideInstruction.onlyPlatonicRelationshipType
          is ExistingRelationshipOverrideInstruction);
    });

    test("onlyRomanticRelationshipType is an existing relationship override instruction", () {
      assert(ExistingRelationshipOverrideInstruction.onlyRomanticRelationshipType
          is ExistingRelationshipOverrideInstruction);
    });

    test("platonicAndRomanticRelationshipType is an existing relationship override instruction", () {
      assert(ExistingRelationshipOverrideInstruction.platonicAndRomanticRelationshipType
          is ExistingRelationshipOverrideInstruction);
    });
  });
}
