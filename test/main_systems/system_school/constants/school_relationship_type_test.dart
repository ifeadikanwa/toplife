// ignore_for_file: unnecessary_type_check

import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_school/constants/school_relationship_type.dart';

void main() {
    group("School Relationship Types Constants:", () {
    test(
      "classmate is a type of school relationship",
      (){
        assert(SchoolRelationshipType.classmate is SchoolRelationshipType);
      }
    );

    test(
      "professor is a type of school relationship",
      (){
        assert(SchoolRelationshipType.professor is SchoolRelationshipType);
      }
    );

  });
}