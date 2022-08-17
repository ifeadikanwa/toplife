// ignore_for_file: unnecessary_type_check

import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_relationship/constants/inlaw_relationship_type.dart';

void main() {
  group("In Law Relationship Type:", () {
    test("parent is a type of in law relationship", () {
      assert(InLawRelationshipType.parent is InLawRelationshipType);
    });

    test("child is a type of in law relationship", () {
      assert(InLawRelationshipType.child is InLawRelationshipType);
    });

    test("sibling is a type of in law relationship", () {
      assert(InLawRelationshipType.sibling is InLawRelationshipType);
    });
  });
}
