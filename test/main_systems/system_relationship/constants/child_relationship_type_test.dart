// ignore_for_file: unnecessary_type_check

import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_relationship/constants/child_relationship_type.dart';

void main() {
  group("Child Relationship Types Constants:", () {
    test(
      "step is a type of child relationship",
      (){
        assert(ChildRelationshipType.step is ChildRelationshipType);
      }
    );

    test(
      "adopted is a type of child relationship",
      (){
        assert(ChildRelationshipType.adopted is ChildRelationshipType);
      }
    );

    test(
      "birth is a type of child relationship",
      (){
        assert(ChildRelationshipType.birth is ChildRelationshipType);
      }
    );
  });
}
