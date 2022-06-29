// ignore_for_file: unnecessary_type_check

import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_relationship/constants/informal_relationship_type.dart';

void main() {
  group("Informal relationship type constants:", () {
    test("acquaintance is a type of informal relationship", () {
      assert(InformalRelationshipType.acquaintance is InformalRelationshipType);
    });

    test("friend is a type of informal relationship", () {
      assert(InformalRelationshipType.friend is InformalRelationshipType);
    });

    test("child is a type of informal relationship", () {
      assert(InformalRelationshipType.child is InformalRelationshipType);
    });

    test("parent is a type of informal relationship", () {
      assert(InformalRelationshipType.parent is InformalRelationshipType);
    });

    test("partner is a type of informal relationship", () {
      assert(InformalRelationshipType.partner is InformalRelationshipType);
    });

    test("sibling is a type of informal relationship", () {
      assert(InformalRelationshipType.sibling is InformalRelationshipType);
    });
  });
}
