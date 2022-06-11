// ignore_for_file: unnecessary_type_check

import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_relationship/constants/parent_relationship_type.dart';

void main() {
  group("Parent Relationship Types Constants:", () {
    test(
      "step is a type of parent relationship",
      (){
        assert(ParentRelationshipType.step is ParentRelationshipType);
      }
    );

    test(
      "adopted is a type of parent relationship",
      (){
        assert(ParentRelationshipType.main is ParentRelationshipType);
      }
    );

    
  });
}