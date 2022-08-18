// ignore_for_file: unnecessary_type_check

import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_relationship/constants/assumed_relationship_type.dart';

void main() {
  group("Assumed relationship type:", () {
     test("niece is an assumed relationship", () {
    assert(AssumedRelationshipType.Neice is AssumedRelationshipType);
  });
  test("nephew is an assumed relationship", () {
    assert(AssumedRelationshipType.Nephew is AssumedRelationshipType);
  });
  test("aunt is an assumed relationship", () {
    assert(AssumedRelationshipType.Aunt is AssumedRelationshipType);
  });
  test("uncle is an assumed relationship", () {
    assert(AssumedRelationshipType.Uncle is AssumedRelationshipType);
  });
  });
 
}
