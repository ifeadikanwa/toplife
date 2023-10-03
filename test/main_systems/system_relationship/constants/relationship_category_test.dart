// ignore_for_file: unnecessary_type_check

import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_relationship/constants/relationship_category.dart';

void main() {
  group("Relationship category:", () {
    test("parent is a relationship category", () {
      assert(RelationshipCategory.parent is RelationshipCategory);
    });

    test("child is a relationship category", () {
      assert(RelationshipCategory.child is RelationshipCategory);
    });

    test("sibling is a relationship category", () {
      assert(RelationshipCategory.sibling is RelationshipCategory);
    });

    test("relative is a relationship category", () {
      assert(RelationshipCategory.relative is RelationshipCategory);
    });

    test("inLaw is a relationship category", () {
      assert(RelationshipCategory.inLaw is RelationshipCategory);
    });

    test("partner is a relationship category", () {
      assert(RelationshipCategory.partner is RelationshipCategory);
    });

    test("friend is a relationship category", () {
      assert(RelationshipCategory.friend is RelationshipCategory);
    });

    test("acquaintance is a relationship category", () {
      assert(RelationshipCategory.acquaintance is RelationshipCategory);
    });
  });
}
